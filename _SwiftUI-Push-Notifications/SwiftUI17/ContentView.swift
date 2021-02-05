import SwiftUI

struct ContentView: View {
    @State var alert = false
    
    var body: some View {
        Button(action: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (status, err) in
                if status{
                    let content = UNMutableNotificationContent()
                    content.title = "Hello this is a test notification"
                    content.subtitle = "I am SwiftUI"
                    content.body = "I am BODY"
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                    return
                }
                self.alert.toggle()
            }
            }){
                Text("Send Notification")
                    .fontWeight(.heavy)
                    .foregroundColor(.green)
        }
        .alert(isPresented: $alert){
            Alert(title: Text("Please enable notification from settings"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
