import SwiftUI
import KeyboardObserving
import SwiftUIX

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var name: String = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            // MARK: - WELCOME TEXT
            if name.isEmpty {
                HStack(spacing: 0) {
                    Text("Hello,")
                        .font(.system(size: 18)).bold()
                        .foregroundColor(Color("gray600"))
                    Text("Guest")
                        .font(.system(size: 18)).bold()
                        .foregroundColor(Color("AccentColor"))
                }
                .padding(16)
            } else {
                HStack(spacing: 0) {
                    Text("Hello,")
                        .font(.system(size: 18)).bold()
                        .foregroundColor(Color("gray600"))
                    Text(name)
                        .font(.system(size: 18)).bold()
                        .foregroundColor(Color("AccentColor"))
                }
                .padding(16)
            }
            
            Divider()
            
            // MARK: - INPUT TEXT FIELD
            VStack(alignment: .leading) {
                Text("Full name")
                    .foregroundColor(Color("gray400"))
                    .font(.callout)
                    .bold()
                CocoaTextField("Enter your name", text: $name)
                    .isFirstResponder(true) /// Auto focus when appear
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.alphabet)
            }
            .padding(16)
        }
        .keyboardObserving()
    }
}

// MARK: - PREVIEWS
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
#endif

// MARK: - DISMISS KEYBOARD
extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window                        = windows.first else { return }
        let tapGesture                          = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType   = false
        tapGesture.cancelsTouchesInView         = false
        tapGesture.delegate                     = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to 'false' if you don't want to detect tap during other gestures
    }
}
