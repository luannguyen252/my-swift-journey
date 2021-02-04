//
//  ViewController.swift
//  AppleMapZoomLevel
//
//  Created by Rohit Saini on 16/06/20.
//  Copyright © 2020 Rohit Saini. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var zoomLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        zoomToLatestLocation(with: COORDINATES.API_DATA.first?.Coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0))
        COORDINATES.API_DATA.forEach { (annotation) in
            addCustomAnnotation(coordinate: annotation.Coordinate, title: annotation.name, type: .API)
        }
        COORDINATES.GEO_DATA.forEach { (annotation) in
            addCustomAnnotation(coordinate: annotation.Coordinate, title: annotation.name, type: .GEO)
        }
           
    }
}

extension ViewController:MKMapViewDelegate{
    
   
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if !(annotation is CustomAnnotation) {
            return nil
        }

        let reuseId = "custom pin"

        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        }
        else {
            anView?.annotation = annotation
        }

        //Set annotation-specific properties **AFTER**
        //the view is dequeued or created...
        anView?.canShowCallout = true
        let pic = annotation as! CustomAnnotation
        anView?.image = pic.customType == .API ? UIImage(named: "api") : UIImage(named: "geo")
        return anView
        
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        zoomLbl.text = "Current Zoom: \(mapView.currentZoomLevel)"
        let annotations = self.mapView.annotations

        for annotation in annotations
        {
            if mapView.currentZoomLevel < 15{
                mapView.view(for: annotation as! CustomAnnotation)?.isHidden = false
            }
            else{
                mapView.view(for: annotation as! CustomAnnotation)?.isHidden = true
            }
        }
    }
    
    
  
    
    func addCustomAnnotation(coordinate:CLLocationCoordinate2D,title:String,type:annotationType) {
        let pin = CustomAnnotation(coor: coordinate)
        pin.title = title
        pin.customType = type
        self.mapView.addAnnotation(pin)
    }

    
    //MARK: - zoomToLatestLocation
    func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: MapZoom.Value, longitudinalMeters: MapZoom.Value)
        mapView.setRegion(zoomRegion, animated: true)
    }
}


extension MKMapView {
    open var currentZoomLevel: Int {
        let maxZoom: Double = 24
        let zoomScale = visibleMapRect.size.width / Double(frame.size.width)
        let zoomExponent = log2(zoomScale)
        return Int(maxZoom - ceil(zoomExponent))
    }

    open func setCenterCoordinate(_ centerCoordinate: CLLocationCoordinate2D,
                                  withZoomLevel zoomLevel: Int,
                                  animated: Bool) {
        let minZoomLevel = min(zoomLevel, 28)
        
        let span = coordinateSpan(centerCoordinate, andZoomLevel: minZoomLevel)
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        
        setRegion(region, animated: animated)
    }
}

let MERCATOR_OFFSET: Double = 268435456 // swiftlint:disable:this identifier_name
let MERCATOR_RADIUS: Double = 85445659.44705395 // swiftlint:disable:this identifier_name
struct PixelSpace {
    public var x: Double // swiftlint:disable:this identifier_name
    public var y: Double // swiftlint:disable:this identifier_name
}

fileprivate extension MKMapView {
    func coordinateSpan(_ centerCoordinate: CLLocationCoordinate2D, andZoomLevel zoomLevel: Int) -> MKCoordinateSpan {
        let space = pixelSpace(fromLongitue: centerCoordinate.longitude, withLatitude: centerCoordinate.latitude)
        
        // determine the scale value from the zoom level
        let zoomExponent = 20 - zoomLevel
        let zoomScale = pow(2.0, Double(zoomExponent))

        // scale the map’s size in pixel space
        let mapSizeInPixels = self.bounds.size
        let scaledMapWidth = Double(mapSizeInPixels.width) * zoomScale
        let scaledMapHeight = Double(mapSizeInPixels.height) * zoomScale
        
        // figure out the position of the top-left pixel
        let topLeftPixelX = space.x - (scaledMapWidth / 2)
        let topLeftPixelY = space.y - (scaledMapHeight / 2)
        
        var minSpace = space
        minSpace.x = topLeftPixelX
        minSpace.y = topLeftPixelY
        
        var maxSpace = space
        maxSpace.x += scaledMapWidth
        maxSpace.y += scaledMapHeight
        
        // find delta between left and right longitudes
        let minLongitude = coordinate(fromPixelSpace: minSpace).longitude
        let maxLongitude = coordinate(fromPixelSpace: maxSpace).longitude
        let longitudeDelta = maxLongitude - minLongitude
        
        // find delta between top and bottom latitudes
        let minLatitude = coordinate(fromPixelSpace: minSpace).latitude
        let maxLatitude = coordinate(fromPixelSpace: maxSpace).latitude
        let latitudeDelta = -1 * (maxLatitude - minLatitude)

        return MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
    }
    
    func pixelSpace(fromLongitue longitude: Double, withLatitude latitude: Double) -> PixelSpace {
        let x = round(MERCATOR_OFFSET + MERCATOR_RADIUS * longitude * Double.pi / 180.0)
        let y = round(MERCATOR_OFFSET - MERCATOR_RADIUS * log((1 + sin(latitude * Double.pi / 180.0)) / (1 - sin(latitude * Double.pi / 180.0))) / 2.0) // swiftlint:disable:this line_length
        return PixelSpace(x: x, y: y)
    }
    
    func coordinate(fromPixelSpace pixelSpace: PixelSpace) -> CLLocationCoordinate2D {
        let longitude = ((round(pixelSpace.x) - MERCATOR_OFFSET) / MERCATOR_RADIUS) * 180.0 / Double.pi
        let latitude = (Double.pi / 2.0 - 2.0 * atan(exp((round(pixelSpace.y) - MERCATOR_OFFSET) / MERCATOR_RADIUS))) * 180.0 / Double.pi // swiftlint:disable:this line_length
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
