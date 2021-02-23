import SwiftUI
import PlaygroundSupport

struct Screen: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView (.vertical, showsIndicators: false) {
                SearchBar()
                Pins()
                ForEach(0..<20) {_ in 
                    NavigationLink(destination: Text("chat view")) {
                        VStack {
                            MessageCell()
                            Divider()
                        }.padding(.horizontal)
                    }
                }
                }
            }.padding().navigationBarTitle("Messages", displayMode: .inline).navigationBarItems(leading: Button(action:{}) {
                Text("Edit")
            }, trailing: Button(action:{}) {
                Image(systemName: "square.and.pencil")
            }).edgesIgnoringSafeArea(.bottom)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SearchBar: View {
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Search")
                Spacer()
                Image(systemName: "mic.fill")
            }.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)).frame(width: 350).foregroundColor(.secondary).background(Color.gray.opacity(0.1)).cornerRadius(8).padding(.horizontal)
        }
    }
}

struct Pins: View {
    var body: some View {
        HStack (spacing: 24) {
            ForEach(0..<3) {_ in 
                VStack (spacing: 18) {
                    Image(systemName: "person.crop.circle.fill").font(.system(size: 92)).foregroundColor(.secondary)
                    Text("Name").font(.footnote).foregroundColor(.secondary)
                }
            }.padding()
        }
    }
}

struct MessageCell: View {
    var body: some View {
        HStack (alignment: .top, spacing: 12) {
            VStack {
                Spacer()
                Image(systemName: "person.crop.circle.fill").foregroundColor(.secondary).font(.system(size: 48))
                Spacer()
            }
            VStack (alignment: .leading, spacing: 2) {
                Text("Full name").font(.headline).bold().foregroundColor(.primary)
                Text("Message Content").foregroundColor(.secondary)
            }
            Spacer()
            HStack {
                Text("09:41 AM").foregroundColor(.secondary)
                Image(systemName: "chevron.right").font(.system(size: 12)).foregroundColor(.secondary)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(Screen())