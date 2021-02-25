//
//  Data.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct Data {
    static let activityItems = [
        ActivityItem(title: "walking", color: Color.purple, imageName: "figure.walk", imageRoataion: 0, progress: 0.5),
        ActivityItem(title: "swimming", color: Color.appSkyBlue, imageName: "figure.walk", imageRoataion: 90, progress: 0.75),
        ActivityItem(title: "cycling", color: Color.appPurple, imageName: "bicycle", imageRoataion: 0, progress: 0.25)
    ]
    
    static let valueItems = [
        ValueItem(title: "walking", imageName: "figure.walk", value: 564, selected: true, imageColor: Color.purple, imageRotation: 0, caloryData: caloryDataWalking),
        ValueItem(title: "swimming", imageName: "figure.walk", value: 293, selected: false, imageColor: Color.appSkyBlue, imageRotation: 90, caloryData: caloryDataSwimming),
        ValueItem(title: "cycling", imageName: "bicycle", value: 250, selected: false, imageColor: Color.appPurple, imageRotation: 0, caloryData: caloryDataCycling)
    ]

    static let caloryDataWalking = [
        CaloryData(hour: "12pm", value: 0),
        CaloryData(hour: "1pm", value: 560),
        CaloryData(hour: "2pm", value: 130),
        CaloryData(hour: "3pm", value: 250),
        CaloryData(hour: "4pm", value: 100),
        CaloryData(hour: "5pm", value: 170),
        CaloryData(hour: "6pm", value: 260),
        CaloryData(hour: "7pm", value: 0)
    ]

    static let caloryDataSwimming = [
        CaloryData(hour: "12pm", value: 0),
        CaloryData(hour: "1pm", value: 280),
        CaloryData(hour: "2pm", value: 10),
        CaloryData(hour: "3pm", value: 150),
        CaloryData(hour: "4pm", value: 50),
        CaloryData(hour: "5pm", value: 220),
        CaloryData(hour: "6pm", value: 360),
        CaloryData(hour: "7pm", value: 0)
    ]

    static let caloryDataCycling = [
        CaloryData(hour: "12pm", value: 0),
        CaloryData(hour: "1pm", value: 180),
        CaloryData(hour: "2pm", value: 100),
        CaloryData(hour: "3pm", value: 350),
        CaloryData(hour: "4pm", value: 200),
        CaloryData(hour: "5pm", value: 570),
        CaloryData(hour: "6pm", value: 110),
        CaloryData(hour: "7pm", value: 0)
    ]
}
