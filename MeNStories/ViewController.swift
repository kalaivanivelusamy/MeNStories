//
//  ViewController.swift
//  MeNStories
//
//  Created by Kalaivani, Velusamy (623-Extern) on 24/06/18.
//  Copyright © 2018 Kalaivani, Velusamy (623-Extern). All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    let initialLocation=CLLocation(latitude: 12.9804141, longitude: 77.7023445)
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        centerUserLocationOnMap(location: initialLocation)
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
           mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //helper methods
    func centerUserLocationOnMap(location:CLLocation){
        let regionDistance:CLLocationDistance = 500
        let coordinateRegion=MKCoordinateRegionMakeWithDistance(location.coordinate,regionDistance, regionDistance)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(<#T##annotation: MKAnnotation##MKAnnotation#>)

    }
    


}

