import SwiftUI

struct CatView: View {
    @State var offsetOne = false
    @State var eyes = false
    @State var eyesblink = false
    @State var mouth = false

    var body: some View {
        ZStack{
            Color.clear
            
            Image("15")
                .resizable()
                .frame(width: 400, height: 235, alignment: .center)
                .offset(y: offsetOne ?  0 : 78)
                .animation(Animation.easeIn(duration: 0.2).delay(1.5))
                .onAppear(){ self.offsetOne.toggle() }

            Image("10")
                .resizable()
                .frame(width: 400, height: 235, alignment: .center)
                .offset(y: eyes ? 0: 78)
                .animation(Animation.easeIn(duration: 0.2).delay(1.5))
                .onAppear(){ self.eyes.toggle() }
                .opacity(eyesblink ? 1: 0)
                .animation(Animation.easeOut(duration: 0.2).delay(0.1).repeatCount(10))
                .onAppear(){ self.eyesblink.toggle() }
            
            Image("11")
                .resizable()
                .frame(width: 400, height: 235, alignment: .center)
                .offset(y: mouth ? 0: 78)
                .animation(Animation.easeIn(duration: 0.2).delay(1.5))
                .onAppear(){ self.mouth.toggle() }
            
            Image("hide")
                .resizable()
                .frame(width: 400, height: 235, alignment: .center)
        }
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
