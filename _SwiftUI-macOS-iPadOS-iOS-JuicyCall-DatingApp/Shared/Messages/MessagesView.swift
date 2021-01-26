
import SwiftUI

struct FindAMatchView: View {
   
    var body: some View {
           Text("Find a Match View")
    }
}

struct MessagesView: View {
    var messages = messageM
    @State var search: String = ""
    var body: some View {
        NavigationView {
            List(messages) { m in
                    NavigationLink(destination: ChatView(message: m.messages)) {
                        Image(systemName:"circlebadge.fill").opacity(m.read ? 0 : 1.0).foregroundColor(Color.accentColor)
                        Image(m.icon).imgAvatar(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            HStack {
                                Text(m.name)
                                    .fontWeight(.medium)
                                    Spacer()
                                Text(m.messages[0].time)
                                    .timeText()
                            }
                            Text(m.messages[0].message)
                                .primaryText()
                        }.buttonStyle(PlainButtonStyle())
                    }.padding(.vertical,8).padding(.horizontal, 0).buttonStyle(PlainButtonStyle())
            }.onAppear(perform: {
                Global.tabBar!.isHidden = false
            })
            .listStyle(InsetListStyle())
            .navigationTitle("Messages")
            .navigationBarItems(trailing: Image("user15").imgAvatar(width: 25, height: 25))
        }
        
    }
}

