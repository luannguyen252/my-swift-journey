import SwiftUI

struct DragAndDrop: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom)
            VStack {
                HStack {
                    ImageView3()
                    ImageView3()
                }
                HStack {
                    ImageView3()
                    ImageView3()
                }
                HStack {
                    ImageView3()
                    ImageView3()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct DragAndDrop_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDrop()
    }
}


struct ImageView3: View {
    enum DragState {
        case inactive
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .dragging(let translation):
                return translation
            default:
                return CGSize.zero
            }
        }
    }
    
    @GestureState var dragState = DragState.inactive
    @State var viewDragState = CGSize.zero
    
    var translationOffset: CGSize {
        return CGSize(width: viewDragState.width + dragState.translation.width, height: viewDragState.height + dragState.translation.height)
    }
    
    var body: some View {
        let dragGesture = DragGesture(minimumDistance: 10)
            .updating($dragState) { value, state, transaction in
                state = .dragging(translation: value.translation)
        }.onEnded { value in
            self.viewDragState.height += value.translation.height
            self.viewDragState.width += value.translation.width
        }
        
        return HStack {
            Image(systemName: "snow")
                .resizable()
                .foregroundColor(Color.blue)
        }
        .padding()
        .frame(width: 150, height: 150)
        .offset(translationOffset)
        .gesture(dragGesture)  
    }
}
