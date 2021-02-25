import SwiftUI

struct ContentView: View {
    @State static var alignment: TextAlignment = .leading
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            AlignmentControl(alignment: ContentView.$alignment)
        }
        .statusBar(hidden: true)
    }
}

// Alignment Control
struct AlignmentControl: View {
    @Binding var textAlignment      :   TextAlignment
    @State private var alignment    :   HorizontalAlignment
    
    var tintColor: Color
    var baseColor: Color

    init(alignment: Binding<TextAlignment>, tintColor: Color = Color("pink2"), baseColor: Color = Color("dark4")) {
        self._textAlignment = alignment
        
        switch alignment.wrappedValue {
            case .leading:
                self._alignment = .init(initialValue: .leading)
            case .center:
                self._alignment = .init(initialValue: .center)
            case .trailing:
                self._alignment = .init(initialValue: .trailing)
        }
        
        self.tintColor = tintColor
        self.baseColor = baseColor
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
            HStack (spacing: 24) {
                AlignmentButton(alignment: .leading) {
                    alignment = .leading
                    textAlignment = .leading
                }
                AlignmentButton(alignment: .center) {
                    alignment = .center
                    textAlignment = .center
                }
                AlignmentButton(alignment: .trailing) {
                    alignment = .trailing
                    textAlignment = .trailing
                }
            }
            .foregroundColor(baseColor)
            
            VStack(alignment: alignment, spacing: 4) {
                AlignmentLine()
                    .animation(Animation.easeOut)
                AlignmentLine()
                    .frame(width: 14, height: 3, alignment: .center)
                    .cornerRadius(1.5)
                    .animation(Animation.easeOut.delay(0.03))
                AlignmentLine()
                    .animation(Animation.easeOut.delay(0.06))
                AlignmentLine()
                    .frame(width: 14, height: 3, alignment: .center)
                    .cornerRadius(1.5)
                    .animation(Animation.easeOut.delay(0.09))
            }
            .foregroundColor(tintColor)
        }
    }
}

// Alignment Line
struct AlignmentLine: View {
    var body: some View {
        Rectangle()
            .frame(width: 25, height: 3, alignment: .center)
            .cornerRadius(1.5)
    }
}

// Alignment Button
struct AlignmentButton : View {
    var alignment   : HorizontalAlignment
    var action      : ()->()
    
    var body: some View {
        Button(action: action, label: {
            VStack(alignment: alignment, spacing: 4) {
                AlignmentLine()
                AlignmentLine()
                    .frame(width: 14, height: 3, alignment: .center)
                    .cornerRadius(1.5)
                AlignmentLine()
                AlignmentLine()
                    .frame(width: 14, height: 3, alignment: .center)
                    .cornerRadius(1.5)
            }
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
