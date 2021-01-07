//
//  GeoManager.swift
//  WorkdayTracker
//
//  Created by Oded Golden on 20/09/2020.
//

import SwiftUI
import CoreLocation
import CoreData

class GeoManager: NSObject, CLLocationManagerDelegate{
            
    private let locationManager = CLLocationManager()
    private let distance = 1
    private var geoFence: CLCircularRegion?
    private var currentDayID: NSManagedObjectID?
    private var completion: (Day) -> () = {_ in return}
    private var context: NSManagedObjectContext!
    
    override init(){
        super.init()
    }
    
    convenience init(using context: NSManagedObjectContext) {
        self.init()
        self.context = context
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        
        if let location = locationManager.location{
            geoFence = CLCircularRegion(center: location.coordinate, radius: CLLocationDistance(distance), identifier: "default")
        }
    }
    
    func setGeoFence(for location: CLLocation, with completion: @escaping (Day) -> ()){
        geoFence = CLCircularRegion(center: location.coordinate, radius: CLLocationDistance(distance), identifier: location.description)
        self.completion = completion
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            if let region = geoFence{
                locationManager.startMonitoring(for: region)
            }
        default:
            print("""
          Your geotification is saved but will only be activated once you grant
          Geotify permission to access the device location.
          """)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region == geoFence{
            guard currentDayID==nil else {return}
            currentDayID = Day.createWith(start: Date(), end: Date(), using: context)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region == geoFence{
            guard let dayID = currentDayID else {return}
            guard let currentDay = try? context?.existingObject(with: dayID) as? Day else {return}
            currentDay.end = Date()
            do {
                try context.save()
                currentDayID = nil
                completion(currentDay)
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
