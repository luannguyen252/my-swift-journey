import SwiftUI

struct RegularBlur: View {
    private var materials: [UIBlurEffect.Style] = [ .systemUltraThinMaterial, .systemThinMaterial, .systemMaterial, .systemThickMaterial, .systemChromeMaterial]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.all, -32)
                .blur(radius: 18)
                .overlay(Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.all, -32).mask(LinearGradient(
                                gradient:
                                    Gradient(
                                        stops: [.init(color: .clear, location: 0),
                                                .init(color: .clear, location: 0.5),
                                                .init(color: .black, location: 1)
                                        ]),
                                startPoint: .bottom, endPoint: .center
                            )))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct RegularBlur_Previews: PreviewProvider {
    static var previews: some View {
        RegularBlur()
    }
}
