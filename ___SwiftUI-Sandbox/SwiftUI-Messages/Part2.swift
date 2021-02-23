import SwiftUI
import PlaygroundSupport

struct Screen: View {
    var body: some View {
        VStack {
            ChatTopView()
            ConversationView()
            ChatBottomBar().padding(.bottom, 10)
        }
    }
}

struct messageTail: Shape {
    var myMessage: Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, myMessage ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        return Path(path.cgPath)
    }
}

struct ChatCell: View {
    var data: Message
    var body: some View {
        HStack {
            if data.myMessage {
                Spacer()
                Text(data.message).padding().background(Color(UIColor.systemBlue)).clipShape(messageTail(myMessage: data.myMessage)).foregroundColor(.white)
            } else {
                Text(data.message).padding().foregroundColor(.primary).background(Color.secondary.opacity(0.2)).clipShape(messageTail(myMessage: data.myMessage))
                Spacer()
            }
        }.padding(data.myMessage ? .leading: .trailing, 55).padding(.vertical, 10)
    }
}

struct ConversationView: View {
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack {
                ForEach(AllMessages) { chat in 
                    ChatCell(data: chat)
                }
            }
        }.padding(.horizontal, 15)
    }
}

struct Message: Identifiable {
    var id: Int
    var message: String
    var myMessage: Bool
}

struct ChatBottomBar: View {
    var body: some View {
        HStack (spacing: 20) {
            Image(systemName: "camera.fill").font(.headline).foregroundColor(.secondary)
            HStack {
                Text("iMessage").font(.subheadline).padding(.leading)
                Spacer()
                Image(systemName: "arrow.up.circle.fill").font(.headline).foregroundColor(.blue)
            }.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)).foregroundColor(.secondary).background(Color.gray.opacity(0.1)).clipShape(Capsule()).shadow(radius: 1)
        }.padding(.horizontal, 20)
    }
}

struct ChatTopView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left").foregroundColor(.blue)
                Spacer()
                VStack {
                    Image(systemName: "person.crop.circle.fill").resizable().frame(width: 40, height: 40).foregroundColor(.secondary)
                    Text("Nav Singh").font(.footnote)
                }
                Spacer()
                Image(systemName: "info.circle").foregroundColor(.blue)
            }.padding()
        }.frame(height: 120).background(Color.gray.opacity(0.1))
    }
}

var AllMessages = [
    Message(id: 0, message: "Here's to the crazy ones, the misfits, the rebels, the troublemakers, the round pegs in the square holes...", myMessage: false),
    Message(id: 1, message: "Here's to the crazy ones, the misfits, the rebels, the troublemakers, the round pegs in the square holes...", myMessage: true),
    Message(id: 2, message: "Here's to the crazy ones, the misfits, the rebels, the troublemakers, the round pegs in the square holes...", myMessage: false),
    Message(id: 3, message: "Here's to the crazy ones, the misfits, the rebels, the troublemakers, the round pegs in the square holes...", myMessage: false),
    Message(id: 4, message: "Here's to the crazy ones, the misfits, the rebels, the troublemakers, the round pegs in the square holes...", myMessage: true)
]

PlaygroundPage.current.setLiveView(Screen())