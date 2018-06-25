//
//  CustomAnnotations.swift
//  MeNStories
//
//  Created by Kalaivani, Velusamy (623-Extern) on 25/06/18.
//  Copyright © 2018 Kalaivani, Velusamy (623-Extern). All rights reserved.
//

import MapKit

class CustomAnnotations: NSObject,MKAnnotation {
    let title:String?
    let locationName:String
    let coordinate: CLLocationCoordinate2D
    
    
    init(title:String,locationName:String,location:CLLocationCoordinate2D) {
        self.title=title
        self.locationName=locationName
        self.coordinate=location
        super.init()
    }
    
    var subtitle: String?{
        return locationName
    }
}
