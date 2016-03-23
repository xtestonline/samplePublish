//
//  VCMapView.swift
//  MapKitTutorial
//
//  Created by Suraj MAC2 on 3/22/16.
//  Copyright © 2016 supaint. All rights reserved.
//

import MapKit

extension ViewController : MKMapViewDelegate{
    
    //1
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Artwork{
            let identifire = "pin"
            var view : MKPinAnnotationView
            if let dequedView =  mapView.dequeueReusableAnnotationViewWithIdentifier(identifire) as? MKPinAnnotationView{
                //2
                dequedView.annotation = annotation
                view = dequedView
            }else{
                //3 
                
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifire)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: -5)
                view.pinTintColor = UIColor.purpleColor()
                view.tag = 0
                view.rightCalloutAccessoryView =  UIButton(type: UIButtonType.DetailDisclosure)  //UIButtonType.DetailDisclosure as? UIView
            }
           return view
        }
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let capital = view.annotation
        let placeName = capital?.title
        let placeInfo = capital?.description
        
        print("placeName\(placeName) \n placeInfo: \(placeInfo)")
    }
}
