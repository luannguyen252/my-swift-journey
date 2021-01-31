//
//  ContentView.swift
//  SwiftUINotification
//
//  Created by Luan Nguyen on 05/01/2021.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @EnvironmentObject var send: SendNotification
    
    func sende() {
        send.alert.toggle()
    }

    var body: some View {
        VStack {
            TextField("Enter your name",text: self.$send.name)
                .padding()
                .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                .cornerRadius(25)
            
            TextField("Enter your message",text: self.$send.message)
                .padding()
                .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                .cornerRadius(25)
            
            Button(action: {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound,.badge]) { (noti, _) in
                    if noti {
                        let notifica = UNMutableNotificationContent()
                        notifica.title = "Notification"
                        notifica.body = "\(self.send.name) : \(self.send.message)"
                        
                        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
                        
                        let request = UNNotificationRequest(identifier: "noti", content: notifica, trigger: triger)
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                        
                        return
                    }
                    self.send.alert.toggle()
                }
            }) {
                Text("Send Notification")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 6)
            }
            .alert(isPresented: self.$send.alert) {
                return Alert(title: Text("Enable the Notification in Settings"))
            }
        }
        .padding(9)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SendNotification())
    }
}
