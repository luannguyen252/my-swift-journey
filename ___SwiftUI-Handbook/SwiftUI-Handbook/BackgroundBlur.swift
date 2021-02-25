import SwiftUI

struct BackgroundBlur: View {
    var body: some View {
        // VisualEffectBlur(blurStyle: .systemMaterial)
        /*
         .systemThickMaterial
         .systemMaterial
         .systemThinMaterial
         .systemUltraThinMaterial
         .systemChromeMaterial
         */
        // Common Usages
//        ZStack {
//            BackgroundView()
//            VisualEffectBlur()
//            ModalView()
//        }
//        VStack {}
//        .background(VisualEffectBlur())
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .padding()
            VisualEffectBlur(blurStyle: .systemMaterial)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 300, height: 400)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        }
    }
}

#if DEBUG
struct BackgroundBlur_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundBlur()
    }
}
#endif
