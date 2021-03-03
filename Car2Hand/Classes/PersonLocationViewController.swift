//
//  PersonLocationViewController.swift
//  Car2Hand
//
//  Created by bahadir on 3.03.2021.
//

import UIKit
import MapKit

class PersonLocationViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var locationNameLabel: UILabel!
    
    var shared_coordinate: CLLocationCoordinate2D?
    var shared_city_town_name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupMap(coordinate: shared_coordinate!)
        setupUI()
    }
    
    func setupUI(){
        locationNameLabel.text = shared_city_town_name
    }
    
    func setupMap(coordinate: CLLocationCoordinate2D){
        let initialLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        map.centerToLocation(initialLocation)
    }
    
    @IBAction func goLocationBtn(_ sender: UIButton) {
        setupMap(coordinate: shared_coordinate!)
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
// CLLocationCoordinate2D(latitude: 36.98308, longitude: 35.332839)
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
