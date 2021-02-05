import SwiftUI
import PlaygroundSupport

struct Screen: View {
    var body: some View {
        TabView {
            InstagramHome().tabItem {
                Image(systemName: "house.fill")
            }
            Text("Instagram").tabItem {
                Image(systemName: "magnifyingglass")
            }
            Text("Instagram").tabItem {
                Image(systemName: "plus.square")
            }
            Text("Instagram").tabItem {
                Image(systemName: "heart")
            }
            Text("Instagram").tabItem {
                Image(systemName: "person")
            }
        }.accentColor(.primary)
    }
}

struct InstagramHome: View {
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach (0..<10) {_ in
                                StatusCard()
                            }
                        }.animation(.spring())
                    }
                    Divider()
                    ForEach(0..<6) {_ in
                        PostCard()
                    }
                }
            }.navigationBarTitle("Instagram", displayMode: .inline).navigationBarItems(leading: Image(systemName: "camera").resizable().frame(width: 30, height: 24), trailing: Image(systemName: "paperplane").resizable().frame(width: 24, height: 24))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct StatusCard: View {
    var body: some View {
        VStack (spacing: 2) {
            Image(systemName: "person.crop.circle.fill").resizable().frame(width: 60, height: 60).clipShape(Circle())
            Text("user").font(.footnote).fontWeight(.light)
        }.padding(.horizontal).padding(.top, 12)
    }
}

struct PostCard: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "person.crop.circle.fill").resizable().frame(width: 30, height: 30).clipShape(Circle())
                VStack (alignment: .leading) {
                    Text("instagram_user").bold()
                    Text("Manhattan, New York").foregroundColor(.secondary).font(.footnote)
                }
                Spacer()
                Button(action: {}) {
                    Text("...")
                }.foregroundColor(.primary)
            }
            Image(uiImage: "image goes here").resizable().frame(height: 350).aspectRatio(contentMode: .fit).padding(.horizontal, -12)
            HStack (spacing: 20) {
                Button(action: {}) {
                    Image(systemName: "heart").resizable().frame(width: 24, height: 24)
                }.foregroundColor(.primary)
                Button(action: {}) {
                    Image(systemName: "message").resizable().frame(width: 24, height: 24)
                }.foregroundColor(.primary)
                Button(action: {}) {
                    Image(systemName: "paperplane").resizable().frame(width: 24, height: 24)
                }.foregroundColor(.primary)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "bookmark").resizable().frame(width: 20, height: 24)
                }.foregroundColor(.primary)
            }.padding(.top, 4)
            VStack (alignment: .leading, spacing: 4) {
                Text("34 likes").font(.subheadline).bold()
                HStack {
                    Text("instagram_user").font(.subheadline).bold()
                    Text("Instagram is a great platform").font(.subheadline).lineLimit(1)
                }
                Text("View all 457 comments").font(.footnote).foregroundColor(.secondary)
            }.padding(.top, 8)
        }.padding(.horizontal, 12).padding(.vertical, 6)
    }
}

PlaygroundPage.current.setLiveView(Screen())