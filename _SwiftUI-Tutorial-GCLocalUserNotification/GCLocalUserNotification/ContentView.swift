import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: GCTimeIntervalView()) {
                    Text("UNTimeIntervalNotificationTrigger")
                }
                NavigationLink(destination: GCCalendarView()) {
                    Text("UNCalendarNotificationTrigger")
                }
            }
            .navigationBarTitle("Main")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
