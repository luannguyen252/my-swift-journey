
import SwiftUI
import PlaygroundSupport

struct Screen: View {
    var body: some View {
        VStack (spacing: 24) {
            HStack {
                Image(systemName: "line.horizontal.3").padding().background(Color.secondary.opacity(0.2)).clipShape(Circle())
                Spacer()
                Image(systemName: "person.crop.circle.fill.badge.plus").resizable().frame(width: 60, height: 50).foregroundColor(Color.secondary.opacity(0.5))
                Spacer()
                Image(systemName: "camera.fill").padding().background(Color.secondary.opacity(0.2)).clipShape(Circle())
            }
            
            ScrollView (.vertical) {
                VStack (spacing: 24) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                        Spacer()
                    }.padding(.all, 8).frame(width: 400).foregroundColor(.secondary).background(Color.gray.opacity(0.1)).cornerRadius(18)
                    
                    MessageCellUnread()
                    
                    ForEach(1..<10) { _ in 
                        MessageCellRead()
                    }
                }
            }
        }.padding().edgesIgnoringSafeArea(.bottom)
    }
}

struct MessageCellRead: View {
    var body: some View {
        HStack (spacing: 18) {
            Image(systemName: "person.crop.circle.fill").resizable().frame(width: 60, height: 60).foregroundColor(Color.secondary.opacity(0.5))
            
            VStack (alignment: .leading, spacing: 2) {
                Text("username")
                Text("Message Content Goes Here.").font(.footnote)
                Text("Active today").font(.caption).foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct MessageCellUnread: View {
    var body: some View {
        HStack (spacing: 18) {
            Image(systemName: "person.crop.circle.fill").resizable().frame(width: 60, height: 60).foregroundColor(Color.secondary.opacity(0.5))
            
            VStack (alignment: .leading, spacing: 2) {
                Text("username").bold()
                Text("Message Content Goes Here.").font(.footnote).bold()
            }
            
            Spacer()
            
            Image(systemName: "circle.fill").foregroundColor(Color(UIColor.systemIndigo))
        }
    }
}

PlaygroundPage.current.setLiveView(Screen())