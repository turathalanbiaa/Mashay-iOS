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
    
    @IBOutlet weak var lostButton: UIButton!
    @IBOutlet weak var placesButton: UIButton!
    @IBOutlet weak var healthButton: UIButton!
    @IBOutlet weak var allButton: UIButton!
    
    
    let pedoMeter = CMPedometer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        saveFirstTimeDateIfNot();
        readPedometerData();
        
        setupUI()
    }
    
    func setupUI()
    {
        lostButton.layer.cornerRadius = 25;
        placesButton.layer.cornerRadius = 25;
        healthButton.layer.cornerRadius = 25;
        allButton.layer.cornerRadius = 25;
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
    
    @IBAction func gotoMapAction(_ sender: Any)
    {
        let button = sender as! UIButton;
        gotoMap(category: button.tag);
    }
    
    func gotoMap(category : Int?)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil);
        let controller = storybord.instantiateViewController(withIdentifier: "NearestPlaceViewController") as! NearestPlaceViewController;
        controller.category = category;
        present(controller, animated: true, completion: nil);
    }
    
    
    
}


