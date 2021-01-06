//
//  ViewController.swift
//  Swift5
//
//  Created by Kushal Ashok on 2020/3/2.
//  Copyright © 2020 com.kushalashok. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.frame = view.frame
        activityIndicatorView.hidesWhenStopped = true
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
    
    @IBAction func getButtonTapped(_ sender: Any) {
        headerLabel.text = "New Quakes"
        getQuakes()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        earthQuakes.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = earthQuakes[indexPath.row].properties.title
        return cell
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

