//
//  SettingsStore.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/29/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import Combine

final class SettingsStore: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    private var didChangeCancellable: AnyCancellable?
    
    @UserDefault(Constants.UserDefaultsKey.notificationsAreEnabled, defaultValue: false)
    var notificationsAreEnabled: Bool

    @UserDefault(Constants.UserDefaultsKey.notificationsPerWeek, defaultValue: 1)
    var notificationsPerWeek: Int

    @UserDefault(Constants.UserDefaultsKey.favoriteCourse, defaultValue: CoursesStore.defaultCourses[0])
    var favoriteCourse: Course

    @UserDefault(Constants.UserDefaultsKey.userEmailAddress, defaultValue: "foo@bar.com")
    var userEmailAddress: String
    

    init(notificationCenter: NotificationCenter = .default) {
        didChangeCancellable = notificationCenter
            .publisher(for: UserDefaults.didChangeNotification)
            .map({ _ in () })
            .receive(on: DispatchQueue.main)
            .subscribe(objectWillChange)
    }
}
