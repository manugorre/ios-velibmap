//
//  ViewController.swift
//  Velibmap
//
//  Created by Emmanuel Gorre on 30/04/2016.
//  Copyright © 2016 Emmanuel Gorre. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UITextViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var stationView: StationView?
    var mapView: MapView?
    
    var stations = [Station]()
    
    
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        setupMapView()
        setupStationView()
        setupDummyData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let widthView = self.view.frame.width
        let heightView = self.view.frame.height
        
        stationView?.frame = CGRectMake(0 , heightView - 60, widthView, 300)
        mapView?.frame = CGRectMake(0 , 0, widthView, heightView)
    }
    
    
    
    // MARK: Setup
    
    func setupStationView() {
        stationView = NSBundle.mainBundle().loadNibNamed(String (StationView), owner: self, options: nil)[0] as? StationView
        self.view.addSubview(stationView!)
    }
    
    func setupMapView() {
        mapView = NSBundle.mainBundle().loadNibNamed(String (MapView), owner: self, options: nil)[0] as? MapView
        self.view.addSubview(mapView!)
    }
    
    private func setupDummyData() {
        for _ in 0 ..< 2 {
            stations.append(Station())
        }
    }
    
    
    
    // MARK: Handlers
    
//    @IBAction func updateInfoStationHandler(sender: AnyObject) {
//        if let stationView = stationView {
//            stationView.updateStationView(stations[0])
////            stationView.show(true)
//        }
//    }
    
    
    
    // MARK: CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

