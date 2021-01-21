import UIKit
import MapKit
class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Statue of Liberty Location
        // 40.6892° N, 74.0445° W
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 40.6892, longitude: -74.0445 )
        
        // To add Title
        annontation.title = "Statue of Liberty National Monument"
        
        // To add Subtitle/Description
        annontation.subtitle = "The Statue of Liberty is a colossal neoclassical sculpture on Liberty Island."
        mapView.addAnnotation(annontation)
        
        // To set map on that location
        // How much to Zoom Out
        // 500 meters zoomed out
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
}
