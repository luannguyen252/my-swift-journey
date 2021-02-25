import SwiftUI
import Combine

struct ContentView: View {
    // Sample story images
    var imageNames                  :   [String]    =   ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8"]
    // Set storytime with 8 photos and 3 seconds for each photo
    @ObservedObject var storyTimer  :   StoryTimer  =   StoryTimer(items: 8, interval: 3.0)

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                // Story photos
                Image(self.imageNames[Int(self.storyTimer.progress)])
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: nil, alignment: .center)
                    .animation(.none)
                // Storytime at top screen
                HStack(alignment: .center, spacing: 4) {
                    ForEach(self.imageNames.indices) { x in
                        LoadingRectangle(progress: min(max((CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0), 1.0))
                            .frame(width: nil, height: 2, alignment: .leading)
                            .animation(.linear)
                    }
                }
                .padding()
            }
            // Storytime will start when to appear
            .onAppear(perform: {
                self.storyTimer.start()
            })
            // Implement TapGestures for each half of the screen to cycle through photos, user can tap left or right to next or previous the photos
            HStack(alignment: .center, spacing: 0) {
                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.storyTimer.advance(by: -1)
                }
                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.storyTimer.advance(by: 1)
                }
            }
        }
    }
}

// Loading, storytime
struct LoadingRectangle: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color("dark").opacity(0.3))
                    .cornerRadius(5)

                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color("dark").opacity(0.9))
                    .cornerRadius(5)
            }
        }
    }
}

// Timer for storytime loading
class StoryTimer: ObservableObject {
    @Published var progress : Double
    private var interval    : TimeInterval
    private var max         : Int
    private let publisher   : Timer.TimerPublisher
    private var cancellable : Cancellable?

    init(items: Int, interval: TimeInterval) {
        self.max        = items
        self.progress   = 0
        self.interval   = interval
        self.publisher  = Timer.publish(every: 0.1, on: .main, in: .default)
    }
    
    func start() {
        self.cancellable        = self.publisher.autoconnect().sink(receiveValue: {  _ in
            var newProgress     = self.progress + (0.1 / self.interval)
            if Int(newProgress) >= self.max { newProgress = 0 }
            self.progress       = newProgress
        })
    }
    
    func cancel() {
        // Do something when story timer is cancel
    }
    
    func advance(by number: Int) {
        let newProgress         = Swift.max((Int(self.progress) + number) % self.max , 0)
        self.progress           = Double(newProgress)
    }
}
