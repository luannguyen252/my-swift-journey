import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            MainView()
            
            VStack {
                Spacer().frame(width: 100, height: 300, alignment: .center)
                
                Rectangle()
                    .frame(width: 380, height: 5, alignment: .center)
                    .foregroundColor(.orange).opacity(1)
                
                Text("The App Wizard")
                    .font(.title3)
                    .foregroundColor(Color.white)
             }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    @State private var Darkmode = false
    @State private var stoneOne = false
    @State private var stoneTwo = false
    @State private var grass = false
    @State private var headanim1 = false
    @State private var headanim2 = false
   
    var body: some View {
        ZStack {
            Image("1")
                .resizable()
                .frame(width: 400, height: 235, alignment: .center)
            
            if Darkmode {
                ZStack {
                    Color("DarkColor").edgesIgnoringSafeArea(.all)
                    
                    CatView()
                    
                    Image("4")
                        .resizable()
                        .frame(width: 400, height: 235, alignment: .center)
                        .opacity(stoneTwo ? 1: 0)
                        .animation(Animation.easeOut(duration: 0.2).delay(0.1).repeatCount(1))
                        .onAppear(){ self.stoneTwo.toggle() }
                    
                    Image("3")
                        .resizable()
                        .frame(width: 400, height: 235, alignment: .center)
                        .opacity(grass ? 1: 0)
                        .animation(Animation.easeOut(duration: 0.2).delay(0.3).repeatCount(1))
                        .onAppear(){ self.grass.toggle() }
                    
                    Image("5")
                        .resizable()
                        .frame(width: 400, height: 235, alignment: .center)
                        .opacity(stoneOne ? 1: 0)
                        .animation(Animation.easeOut(duration: 0.2).delay(0.5).repeatCount(1))
                        .onAppear(){ self.stoneOne.toggle() }
                    
                    TreeView()
                }
            } else {
                Image("1")
                    .resizable()
                    .frame(width: 400, height: 235, alignment: .center)
            }
            
            Toggle(isOn: $Darkmode, label: {}).padding(.all)
                .toggleStyle(DarkmodeStyle())
        }
    }
}

// Github Toggle Darkmode Style
struct DarkmodeStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .foregroundColor(configuration.isOn ? Color("PurpleDark") : .white)
                .frame(width: 51, height: 31, alignment: .center)
                .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Image(configuration.isOn ? "dark" : "light2")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                                .font(Font.title.weight(.black))
                                .frame(width: 8, height: 8, alignment: .center)                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(Animation.linear(duration: 0.1))
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
                .overlay(configuration.isOn ? RoundedRectangle(cornerRadius: 25).stroke(Color("PurpleLight"), lineWidth: 3) : RoundedRectangle(cornerRadius: 25).stroke(Color.gray, lineWidth: 3))
        }
    }
}
