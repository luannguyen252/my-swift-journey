//
//  LoadView.swift
//  Clima
//
//  Created by mohammad mugish on 29/01/21.
//

import SwiftUI

struct LoadApplication: View {
    
    @StateObject var notificationManager = NotificationManager()
    @StateObject var weatherInfoStore = WeatherInformationStore(realm: RealmPersistent.initializer())
    
    var body: some View {
        
        if notificationManager.notificationState == .notDetermined{
            NotificationPermisisonView(notificatoinManager: notificationManager)
        }else if notificationManager.notificationState == .denied || notificationManager.notificationState == .authorized{
            DashboardView(dashboardViewModel: DashboardViewModel(weatherInfoStore: weatherInfoStore, api_handler: API_Handler(weatherInfoStore: weatherInfoStore), notificationManager: notificationManager))
        }
        
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadApplication()
    }
}
