import SwiftUI
import Combine

enum RemoteImageServiceError: Error {
    case couldNotCreateImage
}

enum RemoteImageState {
    case error(_ error: Error)
    case image(_ image: UIImage)
    case loading
}

struct RemoteImage<ErrorView: View, ImageView: View, LoadingView: View>: View {
    private let url: URL
    private let errorView: (Error) -> ErrorView
    private let imageView: (Image) -> ImageView
    private let loadingView: () -> LoadingView
    @ObservedObject private var service: RemoteImageService = RemoteImageService()
    
    var body: AnyView {
        switch service.state {
            case .error(let error):
                return AnyView(
                    errorView(error)
                )
            case .image(let image):
                return AnyView(
                    self.imageView(Image(uiImage: image))
                )
            case .loading:
                return AnyView(
                    loadingView()
                    .onAppear {
                        self.service.fetchImage(atURL: self.url)
                    }
                )
        }
    }
    
    init(url: URL, @ViewBuilder errorView: @escaping (Error) -> ErrorView, @ViewBuilder imageView: @escaping (Image) -> ImageView, @ViewBuilder loadingView: @escaping () -> LoadingView) {
        self.url = url
        self.errorView = errorView
        self.imageView = imageView
        self.loadingView = loadingView
    }
}

final class RemoteImageService: ObservableObject {
    private var cancellable: AnyCancellable?
    
    static let cache = NSCache<NSURL, UIImage>()
    
    var state: RemoteImageState = .loading {
        didSet {
            objectWillChange.send()
        }
    }
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    func fetchImage(atURL url: URL) {
        cancellable?.cancel()
        
        if let image = RemoteImageService.cache.object(forKey: url as NSURL) {
            state = .image(image)
            return
        }
        
        let urlSession = URLSession.shared
        let urlRequest = URLRequest(url: url)
        
        cancellable = urlSession.dataTaskPublisher(for: urlRequest)
            .map { UIImage(data: $0.data) }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure(let failure):
                        self.state = .error(failure)
                    default: ()
                }
            }) { image in
                if let image = image {
                    RemoteImageService.cache.setObject(image, forKey: url as NSURL)
                    self.state = .image(image)
                } else {
                    self.state = .error(RemoteImageServiceError.couldNotCreateImage)
                }
            }
    }
}
