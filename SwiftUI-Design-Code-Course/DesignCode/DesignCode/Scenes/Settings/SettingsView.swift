//
//  SettingsView.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/29/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsStore: SettingsStore
    
    var body: some View {
        Form {
            Section(header: Text("Notifications")) {
                Toggle(isOn: $settingsStore.notificationsAreEnabled) {
                    Text("Receive Notifications")
                }

                Stepper(value: $settingsStore.notificationsPerWeek, in: 1...10) {
                    Text(notificationsPerWeekLabel)
                }
                .disabled($settingsStore.notificationsAreEnabled.wrappedValue == false)
                .foregroundColor(settingsStore.notificationsAreEnabled ? Color.red : Color.gray)
            }
            
            Section(header: Text("Courses")) {
                Picker(
                    selection: $settingsStore.favoriteCourse,
                    label: Text("Favorite Course")
                ) {
                    ForEach(CoursesStore.defaultCourses.indexed(), id: \.1.id) { index, course in
                        Text(course.title).tag(index)
                    }
                }
            }
            
            Section(header: Text("Account")) {
                TextField("Your Email", text: $settingsStore.userEmailAddress)
            }
        }
        .navigationBarTitle("Settings", displayMode: .large)
    
    }
    
    
    var notificationsPerWeekLabel: String {
        switch settingsStore.notificationsPerWeek {
        case 1:
            return "1 Notification Per Week"
        default:
            return "\(settingsStore.notificationsPerWeek) Notifications Per Week"
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
                .environmentObject(SettingsStore())
        }
    }
}
