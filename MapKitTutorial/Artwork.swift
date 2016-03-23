//
//  Artwork.swift
//  MapKitTutorial
//
//  Created by Suraj MAC2 on 3/22/16.
//  Copyright © 2016 supaint. All rights reserved.
//

import UIKit
import MapKit

class Artwork: NSObject,MKAnnotation {

    let title : String?
    var locationName : String = String()
    var discipline : String = String()
    var coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    init(title : String,locationName : String, discipline: String, coordinate : CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    
    var subtitle : String?{
        return locationName
    }
    
   /*
    // pinColor for disciplines: Sculpture, Plaque, Mural, Monument, other
    func pinColor() -> MKPinAnnotationColor  {
        switch discipline {
        case "Sculpture", "Plaque":
            return .Red
        case "Mural", "Monument":
            return .Purple
        default:
            return .Green
        }
    }*/
    
}
