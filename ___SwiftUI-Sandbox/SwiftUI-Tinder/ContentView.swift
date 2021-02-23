import SwiftUI

struct Tinder: View {
    var body: some View {
        ZStack {
            Color.init(red: 242/255, green: 242/255, blue: 242/255).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Image(systemName: "person.fill").resizable().frame(width: 35, height: 35).foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "flame.fill").resizable().frame(width: 35, height: 35).foregroundColor(.red)
                    Spacer()
                    Image(systemName: "message.fill").resizable().frame(width: 35, height: 35).foregroundColor(.gray)
                }.padding(.horizontal)
                Image("image").resizable().frame(height: 560).cornerRadius(12).padding(.vertical, 15).padding(.horizontal, 8).shadow(radius: 4)
                HStack {
                    Group {
                        Image(systemName: "arrow.counterclockwise").resizable().frame(width: 25, height: 25).padding().foregroundColor(.yellow)
                        Image(systemName: "xmark").resizable().frame(width: 30, height: 30).padding().foregroundColor(.pink)
                        Image(systemName: "star.fill").resizable().frame(width: 25, height: 25).padding().foregroundColor(.blue)
                        Image(systemName: "heart.fill").resizable().frame(width: 35, height: 35).padding().foregroundColor(.green)
                        Image(systemName: "sparkles").resizable().frame(width: 25, height: 25).padding().foregroundColor(.purple)
                        }.background(Color.white).shadow(radius: 25).clipShape(Circle())
                }
            }
        }
    }
}

struct Tinder_Previews: PreviewProvider {
    static var previews: some View {
        Tinder()
    }
}
