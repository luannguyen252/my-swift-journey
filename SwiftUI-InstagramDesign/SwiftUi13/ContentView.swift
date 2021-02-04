import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            HomePage()
                .navigationBarTitle("Instagram with SwiftUI")
                .navigationBarItems(leading:Image(systemName: "camera").resizable().frame(width: 25, height: 25),trailing: Image(systemName: "paperplane").resizable().frame(width: 25, height: 25)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomePage:View{
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(0..<20){ i in
                            VStack{
                                Image("user").resizable().frame(width: 80, height: 80).clipShape(Circle()).overlay(Circle().stroke(lineWidth: 3).fill(Color.red)).padding(5)
                                Text("User")
                            }
                        }
                    }
                }
            }
            ForEach(0..<20){ i in
                Feed()
            }
        }
    }
}

struct Feed:View{
    var body: some View{
        VStack{
            HStack{
                Image("user").resizable().frame(width: 40, height: 40).clipShape(Circle())
                
                Text("User")
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "ellipsis").frame(width: 25, height: 25).foregroundColor(.white)
                }
            }.padding(8)
            Image("user").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2).padding([.top,.bottom], 10)
            HStack{
                Image(systemName: "heart").resizable().frame(width: 25, height: 25)
                Image(systemName: "message").resizable().frame(width: 25, height: 25)
                Image(systemName: "paperplane").resizable().frame(width: 25, height: 25)
                Spacer()
                Image(systemName: "bookmark").resizable().frame(width: 25, height: 25)
            }.padding(8)
            HStack{
                VStack(alignment:.leading){
                Text("24,599 likes")
                Text("view all comments").foregroundColor(.gray)
                Text("18 min ago").foregroundColor(.gray)
            }.padding(8)
            Spacer()
            }
        }
    }
}
