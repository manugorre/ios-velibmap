//
//  StationModel.swift
//  Velibmap
//
//  Created by Emmanuel Gorre on 01/05/2016.
//  Copyright © 2016 Emmanuel Gorre. All rights reserved.
//

import UIKit

class Station: NSObject {
    
    var id: Int = 0
    var status: Bool = false
    var name: String = "Paname Station"
    var city: String = "Paris"
    var availableBikesStands: Int = 2
    var availableBikes: Int = 18
    var lat: Double = 0
    var lng: Double = 0
    
    
    
    // MARK: Init
    
    override init() {
    }
    
    init(JSON: [String: AnyObject]) {
        if let id = JSON["number"] as? Int {
            self.id = id
        }
        
        if let status = JSON["status"] as? Int {
//            self.status = status
        }
        
        if let name = JSON["name"] as? String {
            self.name = name
        }
        
        if let lat = JSON["position"]!["lat"] as? Double {
            self.lat = lat
        }
        
        if let lng = JSON["position"]!["lng"] as? Double {
            self.lng = lng
        }
    }
}
