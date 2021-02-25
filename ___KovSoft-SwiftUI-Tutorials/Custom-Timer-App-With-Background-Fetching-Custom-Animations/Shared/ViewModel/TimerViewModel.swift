import SwiftUI
import UserNotifications

// Timer model and data
class TimerData: NSObject, UNUserNotificationCenterDelegate, ObservableObject {
    @Published var time: Int = 0
    @Published var selectedTime: Int = 0
    
    // Animation Properties
    @Published var buttonAnimation = false
    
    // TimerView Data
    @Published var timerViewOffset: CGFloat = UIScreen.main.bounds.height
    @Published var timerHeightChange: CGFloat = 0
    
    // Getting time when it leaves the app
    @Published var leftTime: Date!
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Telling what TO DO when receivies in foreground
        completionHandler([.banner, .sound])
    }
    
    // Ontap
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // When tap resetting view
        completionHandler()
    }
    
    func resetView() {
        withAnimation(.default) {
            time = 0
            selectedTime = 0
            timerHeightChange = 0
            timerViewOffset = UIScreen.main.bounds.height
            buttonAnimation = false
            leftTime = nil
        }
    }
}
