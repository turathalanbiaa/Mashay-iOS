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
    

    
    @IBOutlet weak var todaySteps: UILabel!
    @IBOutlet weak var totalSteps: UILabel!
    
    @IBOutlet weak var lostButton: UIButton!
    @IBOutlet weak var placesButton: UIButton!
    @IBOutlet weak var healthButton: UIButton!
    
    var pedoMeter : PedoMeterReader?;
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        DateUtils.saveFirstTimeDateIfNot();
        pedoMeter = PedoMeterReader(todayLabel: todaySteps , totalLabel: totalSteps);
        pedoMeter?.read();
        
        setupUI()
    }
    
    func setupUI()
    {
        lostButton.layer.cornerRadius = 25;
        placesButton.layer.cornerRadius = 25;
        healthButton.layer.cornerRadius = 25;
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



