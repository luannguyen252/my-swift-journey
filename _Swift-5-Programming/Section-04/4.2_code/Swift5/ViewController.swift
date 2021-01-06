//
//  ViewController.swift
//  Swift5
//
//  Created by Kushal Ashok on 2020/3/2.
//  Copyright © 2020 com.kushalashok. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var quakesTableView: UITableView!

    var earthQuakes = [Quake.Feature]() {
        didSet {
            DispatchQueue.main.async {
                self.quakesTableView.reloadData()
            }
        }
    }
    
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    var locationManager: CLLocationManager?
    var userLocation: CLLocation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.frame = view.frame
        activityIndicatorView.hidesWhenStopped = true
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        getQuakes()
    }
    
    func showActivityIndicator() {
        self.view.addSubview(activityIndicatorView)
        self.activityIndicatorView.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    func showAlertWithTitle(_ title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: false)
    }
    
    @IBAction func getButtonTapped(_ sender: Any) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.requestLocation()
        }
    }
    
    func getQuakes() {
        self.showActivityIndicator()
        guard let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.hideActivityIndicator()
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Something went wrong")
                return
            }
            do {
                let decoder = JSONDecoder()
                let quakes = try decoder.decode(Quake.self, from: dataResponse)
                print(quakes.features.first?.properties.title ?? "")
                self.earthQuakes = quakes.features
            } catch let parsingError {
                print(parsingError)
            }
        }
        
        task.resume()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       earthQuakes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
       cell.textLabel?.text = earthQuakes[indexPath.row].properties.title
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEarthQuake = earthQuakes[indexPath.row]
        showAlertWithTitle("You selected \(selectedEarthQuake.properties.title)")
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            showAlertWithTitle("Lat: \(location.coordinate.latitude), Long: \(location.coordinate.longitude)")
            userLocation = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        showAlertWithTitle("\(error.localizedDescription)")
    }
}
