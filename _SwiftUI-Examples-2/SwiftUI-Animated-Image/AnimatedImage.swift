import Foundation
import SwiftUI
import Combine


/// The ImageSequence protocol represents the playable GIF data. You can create your own type and conform to this protocol, then feed your objects to AnimatedImage views to display those GIFs. The Foundation types 'Data' and 'URL' also conform to ImageSequence, so you can pass either a Data object or GIF URL to AnimatedImage as well.
public protocol ImageSequence {
    var id: String { get }
    var data: Data? { get }
    var placeholder: Image? { get }
}

public extension ImageSequence {
    var placeholder: Image? { return nil }
}

extension Data: ImageSequence {
    public var id: String { "\(self.hashValue)" }
    public var data: Data? { self }
}

extension URL: ImageSequence {
    public var id: String { self.absoluteString }
    public var data: Data? { try? Data(contentsOf: self) }
}

public struct AnimatedImage: View {
    let imageSequence: ImageSequence
    
    @Binding var animated: Bool
    @State var image: UIImage?
    
    let contentMode: ContentMode
    
    init(_  imageSequence: ImageSequence,
         animated: Binding<Bool> = Binding<Bool>.constant(true),
         contentMode: ContentMode = .fit) {
        self.imageSequence = imageSequence
        self._animated = animated
        self.contentMode = contentMode
    }
    
    public var body: some View {
        Group {
            
            if self.animated {
                Group {
                    if self.image != nil {
                        Image(uiImage: self.image!)
                            .resizable()
                            .aspectRatio(self.image!.size, contentMode: self.contentMode)
                    }
                }
                .onReceive(AnimationController.shared.publisher(for: self.imageSequence)) { (img) in
                    self.image = img
                }
            } else {
                
                self.imageSequence.placeholder?.resizable()
            }
            
        }
    }
}


private class AnimationHandler {
    
    init(_ sequence: ImageSequence) {
        self.sequence = sequence
    }
    
    let sequence: ImageSequence
    
    var subscribers = 0
    
    var killAnimation = false
    
    @Published var isAnimating = false
    
    lazy var queue: DispatchQueue = { DispatchQueue(label: "\(self.sequence.id)") }()
    
    lazy var nextAnimationPublisher: AnyPublisher<UIImage, Never> = {
        self.nextAnimationImageSubject.handleEvents(receiveSubscription: { [unowned self] _ in
            self.subscribers += 1
            
            if self.subscribers == 1 {
                self.queue.async { [unowned self] in
                    while self.killAnimation {
                        // wait
                    }
                    self.startAnimation()
                }
            }
            }, receiveCancel: { [unowned self] in
                self.subscribers -= 1
                if self.subscribers == 0 {
                    self.killAnimation = true
                }
        }).eraseToAnyPublisher()
    }()
    
    lazy var nextAnimationImageSubject = PassthroughSubject<UIImage, Never>()
    
    var currentFrame: Int = -1
    func startAnimation() {
        guard !self.isAnimating else { return }
        self.isAnimating = true
        
        if let data = sequence.data {
            
            CGAnimateImageDataWithBlock(data as CFData, nil) { [weak self] x, img, getNext in
                guard let weakSelf = self,
                    weakSelf.subscribers > 0,
                    !weakSelf.killAnimation,
                    (x == weakSelf.currentFrame + 1) || weakSelf.currentFrame == -1 || x == 0 else {
                        self?.currentFrame = -1
                        self?.isAnimating = false
                        getNext.pointee = true
                        
                        self?.queue.async {
                            self?.killAnimation = false
                        }
                        return
                }
                
                weakSelf.currentFrame = x
                weakSelf.nextAnimationImageSubject.send(UIImage(cgImage: img))
            }
        }
    }
    
    var controllerSubscription: AnyCancellable?
}



private class AnimationController {
    
    static let shared = AnimationController()
    
    var handlers = [String: AnimationHandler]()
    
    var cancellables = Set<AnyCancellable>()
    
    func publisher(for imageSequence: ImageSequence) -> AnyPublisher<UIImage, Never> {
        if let handler = handlers[imageSequence.id] {
            return handler.nextAnimationPublisher
        }
        
        let handler = AnimationHandler(imageSequence)
        handlers[imageSequence.id] = handler
        
        handler.controllerSubscription = handler.$isAnimating
            .dropFirst()
            .sink { [weak localHandler = handler, unowned self] animating in
                if let localHandler = localHandler, !animating, localHandler.subscribers == 0 {
                    self.handlers.removeValue(forKey: imageSequence.id)
                    localHandler.controllerSubscription?.cancel()
                    
                }
        }
        return handler.nextAnimationPublisher
    }
}
