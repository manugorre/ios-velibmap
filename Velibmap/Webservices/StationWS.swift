//
//  StationWS.swift
//  Velibmap
//
//  Created by Emmanuel Gorre on 03/05/2016.
//  Copyright © 2016 Emmanuel Gorre. All rights reserved.
//

import UIKit
import Alamofire

class StationWS: NSObject {
    
    let baseUrl = "https://api.jcdecaux.com/vls/v1/"
    let token = ""
    let stationsPath = "stations/"
    let stationPath = "stations/%d"

    func fetchAllStations(completion: [Station]? -> Void) {
        let URLString = String(baseUrl + stationsPath)
        
        Alamofire.request(
            .GET,
            URLString,
            parameters: ["contract": "Paris", "apiKey": token],
            encoding: .URL)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    var stations = [Station]()
                    
                    if let JSON = response.result.value as? [[String: AnyObject]] {
                        for stationJSON in JSON {
                            stations.append(Station(JSON: stationJSON))
                        }
                    }
                    
                    completion(stations)
                case .Failure:
                    completion(nil)
            }
        }
    }
}