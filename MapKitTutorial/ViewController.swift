//
//  ViewController.swift
//  MapKitTutorial
//
//  Created by Suraj MAC2 on 3/22/16.
//  Copyright © 2016 supaint. All rights reserved.
//

import UIKit
import MapKit



class ViewController: UIViewController {

    
//TODO: - General
    
    let initialCoordinate = CLLocation(latitude: 21.282778, longitude: -157.829444)
    let regionRedius : CLLocationDistance = 1000
    //var artworksDict = [String:String]()
//TODO: - Controlls
    
    @IBOutlet weak var mapView: MKMapView!
    
    
//TODO: - Let's Play
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        centerMapOnLocation(initialCoordinate)
        mapView.delegate = self
        let artwork = Artwork(title: "Surya's Place", locationName: "Gateway here", discipline: "Picnic Spot", coordinate: CLLocationCoordinate2D(latitude:  21.283921, longitude: -157.831661))
         let artwork1 = Artwork(title: "Surya's second place", locationName: "Gateway here", discipline: "Picnic Spot", coordinate: CLLocationCoordinate2D(latitude:  21.273274, longitude: -157.694828))
        mapView.addAnnotation(artwork1)
        mapView.addAnnotation(artwork)
    }
    
    func centerMapOnLocation(location:CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRedius * 2.0, regionRedius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        checkLoactionAuthorizationStatus()
        addRadiousCircle(initialCoordinate)
    }

    
    //Access Users Location
    func checkLoactionAuthorizationStatus(){
        let locationManager = CLLocationManager()
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{
            mapView.showsUserLocation = true
            
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    //add radious circle
    func addRadiousCircle(location:CLLocation){
        let circle = MKCircle(centerCoordinate: location.coordinate, radius: 500 as CLLocationDistance)
        self.mapView.addOverlay(circle)
        
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        //if overlay is MKCircle{
         let circle = MKCircleRenderer(overlay: overlay)
            circle.strokeColor = UIColor.redColor()
            circle.fillColor = UIColor(red: 150/255, green: 0/255, blue: 0/255, alpha: 0.1)
            circle.lineWidth = 1
            return circle
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

