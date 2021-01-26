import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("General"), content: {
                    // TODO: Work on ProfileSettings view.
                    NavigationLabel(title: "Profile",
                                  systemName: "person.crop.circle",
                                  destination: Text("destination"))
                    // TODO: Create Notification settings.
                    NavigationLabel(title: "Notifications",
                                  systemName: "app.badge",
                                  destination: Text("destination"))
                })

                Section(header: Text("Privacy"), content: {
                    // TODO: Create Alter settings .
                    NavigationLabel(title: "Alter permissions",
                                  systemName: "heart.text.square",
                                  destination: Text("destination"))
                    // TODO: Create Learn about privacy screen settings.
                    NavigationLabel(title: "Learn about privacy",
                                  systemName: "key",
                                  destination: Text("destination"))
                })
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Settings")
        }
        .tabItem {
            VStack {
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 18))
                Text("Settings")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
