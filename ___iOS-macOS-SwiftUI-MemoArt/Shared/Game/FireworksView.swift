import SwiftUI
import SpriteKit
import Combine

struct FireworksView: View {
    var level: DifficultyLevel

    var body: some View {
        GeometryReader { geometry in
            SpriteView(
                scene: FireworksScene(size: geometry.size, count: count),
                options: .allowsTransparency
            )
            .ignoresSafeArea()
            .allowsHitTesting(false)
        }
    }

    private var count: Int {
        switch level {
        case .easy: return 3
        case .normal: return 6
        case .hard: return 12
        }
    }
}

final class FireworksScene: SKScene {
    var count: Int
    var animationTimerCancellables: [Cancellable]?

    init(size: CGSize, count: Int) {
        self.count = count
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        backgroundColor = .clear
        view.allowsTransparency = true

        let by = 1200/count
        animationTimerCancellables = stride(from: 100, through: 1200, by: by).map { milliseconds in
            Timer.publish(every: 2, on: .main, in: .default)
                .autoconnect()
                .delay(for: .milliseconds(milliseconds), scheduler: DispatchQueue.main)
                .sink { [weak self] _ in
                    guard
                        let self = self,
                        let fireworks = SKEmitterNode(fileNamed: "Fireworks.sks")
                    else { return }

                    let randomPosition = CGPoint(
                        x: CGFloat.random(in: 0..<view.frame.maxX),
                        y: CGFloat.random(in: 0..<view.frame.maxY)
                    )
                    fireworks.position = randomPosition
                    fireworks.isUserInteractionEnabled = false
                    self.addChild(fireworks)
                }
        }

        animationTimerCancellables?.append(
            Timer.publish(every: 2, on: .main, in: .default)
                .autoconnect()
                .sink { [weak self] _ in
                    guard let self = self else { return }
                    self.removeAllChildren()
                }
        )
    }

    deinit {
        animationTimerCancellables?.forEach { $0.cancel() }
    }
}

#if DEBUG
struct FireworksView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FireworksView(level: .easy)
            Divider()
            FireworksView(level: .normal)
            Divider()
            FireworksView(level: .hard)
        }
    }
}
#endif
