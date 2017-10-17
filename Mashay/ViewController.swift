//
//  ViewController.swift
//  Mashay
//
//  Created by AliMac on 10/17/17.
//  Copyright © 2017 TurathAlanbiaa. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController
{
    
    @IBOutlet weak var steps: UILabel!
    
    let pedoMeter = CMPedometer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if(CMPedometer.isStepCountingAvailable())
        {
            let fromDate = Date(timeIntervalSinceNow: -86400 * 7);
            self.pedoMeter.queryPedometerData(from: fromDate, to: Date())
            {
                (data : CMPedometerData!, error) -> Void in
                DispatchQueue.main.async(execute:
                {
                    () -> Void in
                    
                    if(error == nil){
                        self.steps.text = "\(data.numberOfSteps)"
                    }
                })
            }
            
            self.pedoMeter.startUpdates(from: Date(timeIntervalSinceNow: -86400 * 7))
            {
                (data: CMPedometerData!, error) -> Void in
                DispatchQueue.main.async(execute:
                {
                    () -> Void in
                    
                    if(error == nil){
                        self.steps.text = "\(data.numberOfSteps)"
                    }
                })
            }
        }
    }
}


