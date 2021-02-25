import SwiftUI

struct ContentView: View {
    @State private var FABAngle     = false
    @State private var iconPosition = false

    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)

            ZStack {
                Circle()
                    .stroke()
                    .frame(width: 150, height: 150)
                    .opacity(0)
                
                Image(systemName: "circle.bottomhalf.fill")
                    .font(.title)
                    .foregroundColor(Color("pink2"))
                    .offset(x: -75)
                    .rotationEffect(.degrees(iconPosition ? 0 : -180))
                    .animation(Animation.easeInOut(duration: 1).delay(0.3))
                
                Image(systemName: "circle.dashed.inset.fill")
                    .font(.title)
                    .foregroundColor(Color("pink2"))
                    .offset(x: -75)
                    .rotationEffect(.degrees(iconPosition ? 30 : -180))
                    .animation(Animation.easeInOut(duration: 1).delay(0.2))
                
                Image(systemName: "target")
                    .font(.title)
                    .foregroundColor(Color("pink2"))
                    .offset(x: -75)
                    .rotationEffect(.degrees(iconPosition ? 60 : -180))
                    .animation(Animation.easeInOut(duration: 1).delay(0.1))

                Image(systemName: "circle.tophalf.fill")
                    .font(.title)
                    .foregroundColor(Color("pink2"))
                    .offset(x: -75)
                    .rotationEffect(.degrees(iconPosition ? 90 : -180))
                    .animation(Animation.easeInOut(duration: 1))
            }
            .clipShape(Rectangle().offset(x: -20, y: -50))
            .offset(x: 150, y: 335)
          
            VStack {
                Spacer()
                
                HStack {
                    Spacer()

                    ZStack {
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundColor(Color("pink2"))
                            .overlay(Image(systemName: "plus").rotationEffect(.degrees(FABAngle ? 45 : 0)))
                            .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.25))
                            .shadow(color: .black, radius: 10, x: 1, y: 1)
                            .onTapGesture {
                                FABAngle.toggle()
                                iconPosition.toggle()
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
#endif
