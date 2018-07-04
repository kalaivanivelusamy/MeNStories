//
//  ViewController.swift
//  MeNStories
//
//  Created by Kalaivani, Velusamy (623-Extern) on 24/06/18.
//  Copyright © 2018 Kalaivani, Velusamy (623-Extern). All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var mapViewTrailingC: NSLayoutConstraint!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapViewLeadingC: NSLayoutConstraint!

    let locationManager = CLLocationManager()
    let initialLocation=CLLocation(latitude: 12.9804141, longitude: 77.7023445)
    
    var hamburgerMenuVisible = false;
    
    @IBAction func hamburgerTapped(_ sender: Any) {
        
        if !hamburgerMenuVisible{
            mapViewLeadingC.constant = 150
            mapViewTrailingC.constant = -150
            hamburgerMenuVisible = true
        }
        else{
            mapViewTrailingC.constant = 0
            mapViewLeadingC.constant = 0
            hamburgerMenuVisible = false
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        centerUserLocationOnMap(location: initialLocation)
        mapView.delegate=self
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
        
        let annotation = CustomAnnotations(title: "where am i", locationName: "location", location: CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude))
        let regionDistance:CLLocationDistance = 500
        let coordinateRegion=MKCoordinateRegionMakeWithDistance(location.coordinate,regionDistance, regionDistance)
        mapView.setRegion(coordinateRegion, animated: true)
        
        mapView.addAnnotation(annotation)

    }
    


}

extension ViewController:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? CustomAnnotations else{
            return nil
        }
        
        var view:MKMarkerAnnotationView
        let identifier = "marker"
        if let dequedView=mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as?MKMarkerAnnotationView {
            dequedView.annotation=annotation;
            view=dequedView
        }
        
        else{
            view=MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout=true
            view.calloutOffset=CGPoint(x: 5, y: 5)
            view.rightCalloutAccessoryView=UIButton(type: .detailDisclosure)
        }
        
        return view
    }
}

