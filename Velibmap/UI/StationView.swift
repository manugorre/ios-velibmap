//
//  StationView.swift
//  Velibmap
//
//  Created by Emmanuel Gorre on 30/04/2016.
//  Copyright © 2016 Emmanuel Gorre. All rights reserved.
//

import UIKit

class StationView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateView: UIView!
    
    var headerStaionState = false
    
    var station: Station? {
        didSet {
            updateNameLabel()
            updateStateView()
        }
    }
    
    
    // MARK: Static
    
    static func height() -> CGFloat {
        return 40
    }
    
    func setupViewShadow() {
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSizeZero
        self.layer.shadowRadius = 3
    }
    
    // MARK: Public
    
    func updateStationView(stationSelected: Station) {
        station = stationSelected
    }
    
    
    
    // MARK: UIView
    
    override func awakeFromNib() {
        setupViewShadow()
    }
    
    
    
    // MARK: UI
    
    private func updateNameLabel() {
        if let station = station {
            nameLabel.text = station.name
        }
    }
    
    private func updateStateView() {
        if let station = station {
            UIView.animateWithDuration(0.25, animations: {
                self.stateView.backgroundColor = station.status ? UIColor.greenColor() : UIColor.brownColor()
            })
        }
    }
    
    
    
    // MARK: Handlers
    
    @IBAction func openInfoTapHandlers(recognizer: UIGestureRecognizer) {
        let widthView = superview!.frame.width
        let heightView = superview!.frame.height
        UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseInOut, animations: {
            if !self.headerStaionState {
                self.frame = CGRectMake(0 , heightView - 300, widthView, 300)
                self.headerStaionState = true
            } else {
                self.frame = CGRectMake(0 , heightView - 60, widthView, 300)
                self.headerStaionState = false
            }
            
            }, completion: { finished in
        })
        
    }
    
    @IBAction func openInfoDragHandlers(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(superview)

        if recognizer.state.hashValue == 3 {
            if translation.y < -100 {
                print("oui")
            }
        } else {
            print("oui", translation)
        }
    }
    
}
