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
    
    @IBOutlet weak var mapView: UIView!
    
    
    // MARK: UIView
    
    override func awakeFromNib() {
        setupGoogleMap()
    }
    
    
    
    // MARK: Setup
    
    func setupGoogleMap() {
        let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
                                                          longitude: 151.20, zoom: 6)
        let map = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        map.myLocationEnabled = true
        mapView = map
        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
//        marker.map = map
    }
}
