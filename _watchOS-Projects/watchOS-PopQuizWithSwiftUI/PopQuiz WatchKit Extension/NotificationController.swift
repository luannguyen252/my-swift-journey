/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A user notification interface controller that shows a card.
*/

import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var card: Card!

    // The system calls the body property after the didReceive(_ notification:) method.
    override var body: NotificationView {
        NotificationView(card: card)
    }

    override func didReceive(_ notification: UNNotification) {
        guard let cardInfo = (notification.request.content.userInfo["card"] ?? [:]) as? [String: String] else {
            return
        }

        // Create a Card from the information in the notification.
        card = Card(question: cardInfo["question"]!, answer: cardInfo["answer"]!)

        notificationActions = [
            UNNotificationAction(identifier: "correct", title: "Correct", options: []),
            UNNotificationAction(identifier: "incorrect", title: "Incorrect", options: [])
        ]
    }
}
