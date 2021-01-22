import SwiftUI

struct RingGraph: View {
    @State var percent1: Double = 60
    @State var percent2: Double = 70
    @State var percent3: Double = 80
    
    var gRing1:[Color] = [Color.ring1color1, Color.ring1color2]
    var gRing2:[Color] = [Color.ring2color1, Color.ring2color2]
    var gRing3:[Color] = [Color.ring3color1, Color.ring3color2]
    
    private var thickness: CGFloat = 40
    
    var body: some View {
        return NavigationView {
                VStack {
                    Text("今天你已经消耗了 \(String(format: "%.1f", CGFloat((self.percent1 + self.percent2 + self.percent3) / 3)))%")
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .frame(height: 70)
                    
                    Text("保持好你的身体")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
 
                    self.createGrapth().frame(minWidth: 0.0, maxWidth: .infinity)
                    
                    Spacer()
                    
                    HStack {
                        HStack{
                            Rectangle().modifier(NutrientModifier(color: .ring1color1) )
                            Text("碳水化合物")
                            
                        }
                        Spacer()
                        HStack{
                            Rectangle().modifier(NutrientModifier(color: .ring2color2) )
                            Text("蛋白")
                            
                        }
                        Spacer()
                        HStack{
                            Rectangle().modifier(NutrientModifier(color: .ring3color2) )
                            Text("脂肪")
                        }
                    }
                }
                .padding().navigationBarTitle(Text("SwiftUI仿写运动"), displayMode: .inline).navigationBarItems(trailing: self.trailingButton())
        }
    }
    
    private func createGrapth() -> some View{
        let width = UIScreen.main.bounds.width - 20
        return
            ZStack {
                Ring(percent: self.$percent1, thickness: self.thickness, fontSize: 15, gradientColors: gRing1).frame(width: width - thickness, height: width - thickness )
                Ring(percent: self.$percent2, thickness:  self.thickness, fontSize: 15, gradientColors: gRing2).frame(width: width - thickness * 3, height: width - thickness * 3)
                Ring(percent: self.$percent3, thickness:  self.thickness, fontSize: 15, gradientColors: gRing3).frame(width: width - thickness * 5, height: width - thickness * 5)
            }
    }
    
    private func trailingButton() -> some View{
          return Button(action: {
              withAnimation(.easeInOut(duration: 1)) {
                  self.percent1 = Double.random(in: 1...100)
                  self.percent2 = Double.random(in: 1...100)
                  self.percent3 = Double.random(in: 1...100)
              }
          }) {
              Image(systemName: "arrow.clockwise")
                  .resizable()
                  .frame(width: 25, height: 30)
                .foregroundColor(.ring3color2)
                  .aspectRatio(contentMode: ContentMode.fit)
          }
      }
}

struct NutrientModifier: ViewModifier {
    var color: Color = .red
    func body(content: Content) -> some View {
           content.foregroundColor(color)
           .frame(width: 25, height: 25)
           .cornerRadius(4)
    }

}

extension Color {
    static var ring1color1: Color {
        return Color("ring1color1")
    }
    static var ring1color2:Color {
        return Color("ring1color2")
    }
    static var ring2color1:Color {
        return Color("ring2color1")
    }
    static var ring2color2:Color {
        return Color("ring2color2")
    }
    static var ring3color1:Color {
        return Color("ring3color1")
    }
    static var ring3color2:Color {
        return Color("ring3color2")
    }
}

struct RingGraph_Previews: PreviewProvider {
    static var previews: some View {
        RingGraph()
    }
}
