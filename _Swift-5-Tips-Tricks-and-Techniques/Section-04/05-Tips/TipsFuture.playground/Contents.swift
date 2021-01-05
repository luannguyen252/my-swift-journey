import UIKit
import EventKit

let batteryState: UIDevice.BatteryState? = nil

switch batteryState {
case .full:
    print("Device is fully charged")
case nil:
    print("Nil case")
default:
    print("Handle error cases")
}


let eventType: EKEntityType = .event


switch eventType {
case .event:
    print("event")
case .reminder:
    print("reminder")
@unknown default:
    print("error, please update the app")
}
