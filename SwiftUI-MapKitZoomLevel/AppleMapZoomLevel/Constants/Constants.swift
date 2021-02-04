//
//  Constants.swift
//  AppleMapZoomLevel
//
//  Created by Rohit Saini on 16/06/20.
//  Copyright © 2020 Rohit Saini. All rights reserved.
//

import Foundation
import MapKit

struct MapZoom{
    static let Value: CLLocationDistance = 100000
}

struct COORDINATES{
    static let API_DATA:[AnnotationObject] = [AnnotationObject(name: "Mayville Primary School", Coordinate: CLLocationCoordinate2D(latitude: 51.5603671, longitude: 0.005416199999999998), type: .API)
        ,AnnotationObject(name: "Lime Tree Surgery", Coordinate: CLLocationCoordinate2D(latitude: 52.982357, longitude: -1.196805),type: .API)
        ,AnnotationObject(name: "Lime Tree Surgery", Coordinate: CLLocationCoordinate2D(latitude: 51.555718, longitude: 0.005417),type: .API)
        ,AnnotationObject(name: "High Road Surgery", Coordinate: CLLocationCoordinate2D(latitude: 51.553486, longitude: 0.004958),type: .API)
        ,AnnotationObject(name: "The Thatched House Dental Practice", Coordinate: CLLocationCoordinate2D(latitude: 51.552446, longitude: 0.00585),type: .API)
        ,AnnotationObject(name: "Ashville House", Coordinate: CLLocationCoordinate2D(latitude: 51.562621, longitude: 0.000858), type: .API)]
    
    static let GEO_DATA:[AnnotationObject] = [AnnotationObject(name: "Mayville Primary School", Coordinate: CLLocationCoordinate2D(latitude: 51.56037019999999, longitude: 0.0054274), type: .GEO)
        ,AnnotationObject(name: "Lime Tree Surgery", Coordinate: CLLocationCoordinate2D(latitude: 52.9822936, longitude: -1.1962013),type: .GEO)
        ,AnnotationObject(name: "Lime Tree Surgery", Coordinate: CLLocationCoordinate2D(latitude: 51.5547283, longitude: 0.005154499999999998),type: .GEO)
        ,AnnotationObject(name: "High Road Surgery", Coordinate: CLLocationCoordinate2D(latitude: 51.5539002, longitude: 0.004957899999999999),type: .GEO)
        ,AnnotationObject(name: "The Thatched House Dental Practice", Coordinate: CLLocationCoordinate2D(latitude:51.5522854 , longitude: 0.0058962000000000025),type: .GEO)
        ,AnnotationObject(name: "Ashville House", Coordinate: CLLocationCoordinate2D(latitude: 51.5629771, longitude: 0.0013582), type: .GEO)]
}

struct AnnotationObject{
    var name: String
    var Coordinate:CLLocationCoordinate2D
    var type:annotationType
}
enum annotationType:String{
    case API
    case GEO
}
