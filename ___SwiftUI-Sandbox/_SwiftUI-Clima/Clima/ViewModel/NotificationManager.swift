//
//  NotificationManager.swift
//  Clima
//
//  Created by mohammad mugish on 28/01/21.
//

import Foundation
import UserNotifications


class NotificationManager : NSObject, UNUserNotificationCenterDelegate, ObservableObject{
    
    
    private let notificationCenter = UNUserNotificationCenter.current()
    @Published var notificationState : UNAuthorizationStatus?
    
    override init(){
        super.init()
        
        checkNotificationState()
    }
    
  
    func checkNotificationState() {
        
        
        notificationCenter.getNotificationSettings(completionHandler: { (settings) in
            
            if settings.authorizationStatus == .notDetermined {
                DispatchQueue.main.async {
                    self.notificationState = .notDetermined
                }
                // Notification permission has not been asked yet, go for it!
            } else if settings.authorizationStatus == .denied {
                
                DispatchQueue.main.async {
                    self.notificationState = .denied
                }
                // Notification permission was previously denied, go to settings & privacy to re-enable
            } else if settings.authorizationStatus == .authorized {
                DispatchQueue.main.async {
                    self.notificationState = .authorized
                }
                // Notification permission was already granted
            }
        })
     
    }
    
    func requestForNotificationAuthorization(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
                DispatchQueue.main.async {
                    self.notificationState = .authorized
                }
                self.notificationCenter.delegate = self
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    func showNotification(title : String, subtitle : String, timeInterval : Double, repeats : Bool){
        
        
        let content = UNMutableNotificationContent()
        
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])

    }
}


