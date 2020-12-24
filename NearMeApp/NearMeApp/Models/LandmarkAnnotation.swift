//
//  LandmarkAnnotation.swift
//  NearMeApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import MapKit
import UIKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
