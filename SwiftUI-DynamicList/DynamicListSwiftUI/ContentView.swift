import SwiftUI

struct User: Identifiable {
    var id: Int
    let username, message: String
}

struct ContentView: View {
    let users: [User] = [
        .init(id: 0, username: "Tim Cook", message: "My nice shiny new monitor stand is $999"),
        .init(id: 1, username: "Park kyung suk", message: "Time is money"),
        .init(id: 2,username: "Jon Ivey", message: "My nice shiny new monitor stand is $999")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Text("Users").font(.largeTitle)
                ForEach(users) { user in
                    UserRow(user: user)
                }
               
            }
            .navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow: View {
    var user: User
    
    var body: some View {
        HStack {
            Image(String(user.id + 1))
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .aspectRatio(contentMode: .fit)
            VStack (alignment: .leading) {
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline)
            }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
