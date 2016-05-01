//
//  ViewController.swift
//  Velibmap
//
//  Created by Emmanuel Gorre on 30/04/2016.
//  Copyright © 2016 Emmanuel Gorre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    var stationView: StationView?
    
    var stations = [Station]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    }
    
    
    
    // MARK: Setup
    
    private func setupDummyData() {
        for _ in 0 ..< 2 {
            stations.append(Station())
        }
    }
    
    func setupStationView() {
        stationView = NSBundle.mainBundle().loadNibNamed(String (StationView), owner: self, options: nil)[0] as? StationView
        self.view.addSubview(stationView!)
    }
    
    
    
    // MARK: Handlers
    
    @IBAction func updateInfoStationHandler(sender: AnyObject) {
        if let stationView = stationView {
            stationView.updateStationView(stations[0])
//            stationView.show(true)
        }
    }
    


}

