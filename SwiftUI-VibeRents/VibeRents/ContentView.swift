import SwiftUI

struct Post {
    let id: Int
    let username, text, imagename: String
}

struct ContentView: View {
    let posts: [Post] = [
        .init(id: 0, username: "Tanaya Henry", text: "Good old times in the bay area", imagename: "burger"),
        .init(id: 1, username: "Tanaya Henry", text: "Good old times in the bay area", imagename: "post_puppy")
    ]
    
    var body: some View {
        NavigationView {
            List {
                VStack (alignment: .leading) {
                    Text("Trending")
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack(alignment: .leading) {
                                HStack {
                                    NavigationLink(destination: GroupDetailView()) {
                                        GroupView()
                                    }

                                    GroupView()
                                    GroupView()
                                    GroupView()
                                    GroupView()
                                    GroupView()
                            }
                        }
                    }
                    .frame(height: 180)
                }
                
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }
            .navigationBarTitle(Text("Groups"))
        }
    }
}

struct GroupDetailView: View {
    var body: some View {
        Text("Group DETAIL VIEW")
    }
}

struct GroupView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Image("hike").renderingMode(.original)
                .resizable()
                .cornerRadius(12)
                .frame(width: 60, height: 70)
            Text("These are the it girls")
                .foregroundColor(.primary).lineLimit(nil)
                .padding(.leading, 0)
        }
        .frame(width: 70, height: 170)
    }
}

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("burger")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 70)
                    .clipped()
                VStack (alignment: .leading, spacing: 4) {
                    Text(post.username).font(.headline)
                    Text("Miami, Brickelli Bay").font(.subheadline)
                }
                .padding(.leading, 8)
            }
            .padding(.leading, 1)
            .padding(.top, 16)
            
            Text("Post body text that will hopefully suport auto sizing vertically and span mutliple line").lineLimit(nil)
            
            Image(post.imagename)
                .resizable()
                .frame(width: 400, height: 550)
        }
        .padding(.leading, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
