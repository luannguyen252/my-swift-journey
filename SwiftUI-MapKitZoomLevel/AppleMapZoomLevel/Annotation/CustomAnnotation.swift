//
//  CustomAnnotation.swift
//  AppleMapZoomLevel
//
//  Created by Rohit Saini on 16/06/20.
//  Copyright © 2020 Rohit Saini. All rights reserved.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var customType:annotationType = .API
    
    init(coor: CLLocationCoordinate2D)
    {
        coordinate = coor
    }
}
