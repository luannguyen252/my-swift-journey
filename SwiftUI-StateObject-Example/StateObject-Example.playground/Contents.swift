import SwiftUI
import Combine
import PlaygroundSupport

class Count: ObservableObject {
    @Published var value: Int = 0 {
        didSet {
            print("value: \(value)")
        }
    }
    
}

struct OuterStepperView: View {
    // @ObservedObject var counter = Count()
    @StateObject var counter = Count()

    var body: some View {
        VStack {
            Stepper("Counter: \(counter.value)") {
                counter.value += 1
            } onDecrement: {
                counter.value -= 1
            }
        }
    }
}

struct TwoStepperView: View {
    @State var stepper: Int = 0
    
    var body: some View {
        VStack {
            Stepper("Inner Stepper: \(stepper)") {
                stepper += 1
            } onDecrement: {
                stepper -= 1
            }
            OuterStepperView()
        }
    }
}

PlaygroundPage.current.setLiveView(TwoStepperView())
