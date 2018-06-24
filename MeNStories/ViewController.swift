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
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthorizationStatus()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
           // mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

