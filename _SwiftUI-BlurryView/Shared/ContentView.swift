
import SwiftUI

extension Color {
    static let teal = Color(red: 13 / 255, green: 245 / 255, blue: 237  / 255)
}

struct ContentView: View {
    
    var body: some View {
        
        #if os(iOS)
        ios
        #else
        macOS
        #endif
    }
    
    var ios: some View {
        HStack(alignment: .center) {
            ZStack {
                ZStack(alignment: .trailing) {
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea().frame(maxWidth: .infinity, maxHeight: .infinity)
                    Color.teal.frame(width: 50, height: UIScreen.main.bounds.height - 20).ignoresSafeArea()
                    BlurView(style: .regular).frame(width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height ).ignoresSafeArea()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                Card()
            }
        }
    }
    
    var macOS: some View {
        ZStack(alignment: .trailing) {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea().frame(maxWidth: .infinity, maxHeight: .infinity)
            Color.green.frame(width: 50, height: 200).ignoresSafeArea()
            Color.red.opacity(0.3).frame(width:  200, height: 200 ).ignoresSafeArea()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct Card: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            HStack{
                Image(systemName: "applelogo").font(.largeTitle)
                Text("Apple Card")
            }.padding(20).lineSpacing(2)
            Text("5612 2536 1245 5698").tracking(4).padding([.top,.leading])
            HStack {
                Text("1234").font(.caption).fontWeight(.light)
                Spacer()
                VStack {
                    Text("VALID").font(.caption2).fontWeight(.thin)
                    Text("THRU").font(.caption2).fontWeight(.thin)
                }
                Text("12/21")
                Spacer()
            }.padding(.leading).padding([.top, .bottom], 10)
            Text("Mr Tony").tracking(0.5).padding([.leading, .bottom]).padding(.bottom, 20)
        }.background(BlurView(style: .regular)).cornerRadius(20).shadow(radius: 10).padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: Blur Effect
struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {
        
    }
    
}
