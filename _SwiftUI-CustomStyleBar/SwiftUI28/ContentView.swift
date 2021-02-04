import SwiftUI

struct ContentView: View {
    @State var index = 0
    
    var body: some View {
        VStack{
            ZStack{
                if index == 0{
                    Color.red.edgesIgnoringSafeArea(.top)
                }
                if index == 1{
                    Color.green.edgesIgnoringSafeArea(.top)
                }
                if index == 2{
                    Color.yellow.edgesIgnoringSafeArea(.top)
                }
                if index == 3{
                    Color.blue.edgesIgnoringSafeArea(.top)
                }
            }.animation(.spring())
            CustomTabbar(index: $index)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabbar:View{
    @Binding var index: Int
    
    var body: some View{
        HStack{
            HStack{
                Image(systemName: "house.fill").resizable().frame(width:24 ,height:24)
                Text(self.index == 0 ? "Home": "").fontWeight(.medium)
            }
            .padding(15)
            .background(self.index == 0 ? Color.red.opacity(0.5) : Color.clear)
            .clipShape(Capsule())
            .onTapGesture {
                self.index  = 0
            }
            
            HStack{
                Image(systemName: "smoke.fill").resizable().frame(width:24 ,height:24)
                Text(self.index == 1 ? "Smoke": "").fontWeight(.medium)
            }
            .padding(15)
            .background(self.index == 1 ? Color.green.opacity(0.5) : Color.clear)
            .clipShape(Capsule())
            .onTapGesture {
                self.index  = 1
            }
            HStack{
                Image(systemName: "umbrella.fill").resizable().frame(width:24 ,height:24)
                Text(self.index == 2 ? "Rain": "").fontWeight(.medium)
            }
            .padding(15)
            .background(self.index == 2 ? Color.yellow.opacity(0.5) : Color.clear)
            .clipShape(Capsule())
            .onTapGesture {
                self.index  = 2
            }
            HStack{
                Image(systemName: "music.mic").resizable().frame(width:24 ,height:24)
                Text(self.index == 3 ? "Music": "").fontWeight(.medium)
            }
            .padding(15)
            .background(self.index == 3 ? Color.blue.opacity(0.5) : Color.clear)
            .clipShape(Capsule())
            .onTapGesture {
                self.index  = 3
            }
        }
        .padding(.top,8)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.white)
        .animation(.default)
    }
}
