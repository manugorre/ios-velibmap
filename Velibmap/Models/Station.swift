//
//  StationModel.swift
//  Velibmap
//
//  Created by Emmanuel Gorre on 01/05/2016.
//  Copyright © 2016 Emmanuel Gorre. All rights reserved.
//

import UIKit

class Station: NSObject {

    var idStation: Int = 0
    var state: Bool = false
    var name: String = "Paname Station"
    var city: String = "Paris"
    var availableBikesStands: Int = 2
    var availableBikes: Int = 18
}
