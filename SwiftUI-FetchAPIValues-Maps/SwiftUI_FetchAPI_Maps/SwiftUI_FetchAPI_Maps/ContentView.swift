
import SwiftUI
import Combine

struct ContentView : View {
    @ObservedObject var apiManager: APIManager
    var body: some View {
        NavigationView {
            List {
                ForEach(apiManager.users,id: \.id) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("User Information"))
        }
    }
}
