import SwiftUI

struct TeamsView: View {
    var body: some View {
        NavigationView {
            Text("Teams")
                .navigationBarTitle("Teams")
        }
        .tabItem {
            VStack {
                Image(systemName: "person.3.fill")
                    .font(.system(size: 18))
                Text("Teams")
            }
        }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
