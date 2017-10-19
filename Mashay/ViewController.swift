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
    
    let FIRST_TIME_DATE = "FIRST_TIME_DATE";
    
    @IBOutlet weak var todaySteps: UILabel!
    @IBOutlet weak var totalSteps: UILabel!

    
    let pedoMeter = CMPedometer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        saveFirstTimeDateIfNot();
        readPedometerData();
    }
    
    
    func readPedometerData()
    {
        if(CMPedometer.isStepCountingAvailable())
        {
            let time = UserDefaults.standard.object(forKey: FIRST_TIME_DATE) as! Int;
            let interval = TimeInterval(time);
            let fromDate = Date(timeIntervalSinceNow: interval);
            print(fromDate);
            self.pedoMeter.queryPedometerData(from: fromDate, to: Date())
            {
                (data : CMPedometerData!, error) -> Void in
                DispatchQueue.main.async(execute:
                    {
                        () -> Void in
                        if(error == nil){
                            self.totalSteps.text = "\(data.numberOfSteps)"
                        }
                })
            }
            
            self.pedoMeter.startUpdates(from: Date())
            {
                (data: CMPedometerData!, error) -> Void in
                DispatchQueue.main.async(execute:
                    {
                        () -> Void in
                        if(error == nil){
                            self.todaySteps.text = "\(data.numberOfSteps)"
                        }
                })
            }
        }
        else
        {
            self.todaySteps.text = "غير معروف"
            self.totalSteps.text = "غير معروف"
        }
    }
    
    func saveFirstTimeDateIfNot()
    {
        let firstTimeDate = UserDefaults.standard.object(forKey: FIRST_TIME_DATE);
        if firstTimeDate == nil
        {
            let date = Date();
            UserDefaults.standard.set(date.timeIntervalSince1970, forKey: FIRST_TIME_DATE)
            UserDefaults.standard.synchronize();
        }
    }
    
}


