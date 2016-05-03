//
//  MapView.swift
//  Velibmap
//
//  Created by Emmanuel Gorre on 01/05/2016.
//  Copyright © 2016 Emmanuel Gorre. All rights reserved.
//

import UIKit
import GoogleMaps

class MapView: UIView {
    
    var stations = [Station]()
    var markers = [GMSMarker]()
    
    @IBOutlet weak var mapView: GMSMapView!

    
    
    // MARK: UIView
    
    override func awakeFromNib() {
        fetchStations()
    }
    
    
    
    // MARK: Setup
    
    func setupGoogleMap() {
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(48.857165, longitude: 2.354613, zoom: 8.0)
        mapView.camera = camera
        
        for station in stations {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(station.lat, station.lng)
            marker.map = mapView
            markers.append(marker)
        }
    }
    
    
    
    // MARK: API
    
    func fetchStations() {
        
        let stationWS = StationWS()
        
        stationWS.fetchAllStations() { responseObject in
            print("responseObject = \(responseObject![0].lat);")
            self.stations = responseObject!
            self.setupGoogleMap()
            return
        }
    }
}
