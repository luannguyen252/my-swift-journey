import SwiftUI

struct ZStackCard: View {
    enum DragState {
        case inactive
        case active(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .active(let translation):
                return translation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .active:
                return true
            }
        }
    }
    
    @GestureState var gestureState = DragState.inactive
    @State var list = [0, 1, 2]
    var cardColors:[Color] = [.red, .blue, .yellow]
    var offsets:[CGSize] = [.init(width: 0, height: -40.0), .init(width: 0, height: -20.0), .zero]
    var viewCenter = CGSize.zero

    var body: some View {
        let gesture = DragGesture().updating($gestureState) { value, state,_ in
            state = .active(translation: value.translation)
        }.onEnded {  _ in
            self.list.insert(self.list.last!, at: 0)
            self.list.removeLast()
        }

        return ZStack {
            ForEach(0..<self.list.count, id: \.self) { i in
                ZStack(alignment: .bottomTrailing) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300.0, height: 400.0)
                        .shadow(radius: 15)
                        .foregroundColor(self.cardColors[self.list[i]])
                    
                    Text("\(self.list.count - 1 - self.list[i])")
                        .font(.largeTitle)
                        .foregroundColor(Color.white.opacity(0.6))
                        .bold()
                        .padding()
                        
                }
                .gesture(gesture)
                .scaleEffect((i == self.list.count - 1 && self.gestureState.isActive) ? 1.25 : 1)
                .offset(x:self.viewCenter.width + self.offsets[i].width + self.gestureState.translation.width * (i == self.list.count - 1 ? 1 : 0),
                        y:self.viewCenter.height + self.offsets[i].height + self.gestureState.translation.height * (i == self.list.count - 1 ? 1 : 0))
                .animation(.spring(response: 0.3))
            }
        }
    }
}

struct ZStackCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStackCard()
        .previewDevice("iPhone 11")
    }
}
