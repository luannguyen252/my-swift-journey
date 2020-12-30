//
//  NotificationController.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 25.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    private var viewModel: NotificationViewModel?
    
    override var body: NotificationView {
        return NotificationView(viewModel: viewModel!)
    }
    
    override func didReceive(_ notification: UNNotification) {
        do {
            let plantInfo = notification.request.content.userInfo["plant"] as! [String: Any]
            let data = try JSONSerialization.data(withJSONObject: plantInfo, options: [])
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let plant = try decoder.decode(Plant.self, from: data)
            viewModel = NotificationViewModel(plant: plant)
        }
        catch let nsError as NSError {
            print(nsError.localizedDescription)
        }
        
        let doneTitle = NSLocalizedString("NotificationAction_Done", comment: "Done button title in notification.")
        let laterTitle = NSLocalizedString("NotificationAction_Later", comment: "Later button title in notification.")
        let tomorrowTitle = NSLocalizedString("NotificationAction_Tomorrow", comment: "Tomorrow button title in notification.")
        notificationActions = [
            UNNotificationAction(identifier: "water_done", title: doneTitle, options: []),
            UNNotificationAction(identifier: "water_later", title: laterTitle, options: []),
            UNNotificationAction(identifier: "water_tomorrow", title: tomorrowTitle, options: [])
        ]
    }
}
