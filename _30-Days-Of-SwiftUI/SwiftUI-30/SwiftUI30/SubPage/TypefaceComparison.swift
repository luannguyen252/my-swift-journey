import SwiftUI

func formatDegree(degree: Double)->String{
    return String(format: "%.1f", fabs(degree))
}

struct TypefaceComparison: View {
    enum DragState {
        case inactive
        case active(translation: CGSize)
        
        var translation: CGSize{
            switch self {
            case .inactive:
                return .zero
            case .active(let t):
                return t
            }
        }
        
        var isActive: Bool{
            switch self {
            case .inactive:
                return false
            case .active:
                return true
            }
        }
    }
    
    @GestureState var gestureState = DragState.inactive
    @State var viewState = CGSize.zero
    @State var rotationX: Double
    
    var body: some View {
        let dragGuesture = DragGesture()
            .updating($gestureState){value, state,_ in
                state = .active(translation: value.translation)
        }
        
        return
            VStack {
                Spacer()
                
                ZStack {
                    Text("Text")
                        .font(.system(size: 100))
                        .bold()
                        .foregroundColor(Color.red.opacity(0.5))
                        .offset(x: viewState.width - CGFloat(rotationX), y: viewState.height)
                    
                    Text("Text")
                    .font(.system(size: 100))
                    .bold()
                    .foregroundColor(Color.blue.opacity(0.6))
                    .offset(x: viewState.width + gestureState.translation.width + CGFloat(rotationX),
                            y: viewState.height + gestureState.translation.height)
                    .gesture(dragGuesture)
                    .animation(.spring())
                }
                .rotation3DEffect(.degrees(rotationX), axis: (x: 0, y: 1, z: 0))
                
                Spacer()
                
                HStack {
                    Image(systemName: "45.circle")
                        .font(.system(size: 20))
                        .accentColor(Color.black)
                    
                    Slider(value: $rotationX, in: -45...45)
                    
                    Image(systemName: "45.circle")
                        .font(.system(size: 20))
                        .accentColor(Color.black)
                }
                .padding(.horizontal)
                
                Text("Degree \(formatDegree(degree: rotationX))")
                    .font(.headline)
                    .bold()
        }
            .padding()
    }
}

struct TypefaceComparison_Previews: PreviewProvider {
    static var previews: some View {
        TypefaceComparison(rotationX: 0.0)
    }
}
