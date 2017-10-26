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
    
    
    @IBOutlet weak var ziara1Button: UIButton!
    
    @IBOutlet weak var ziara2Button: UIButton!
    
    @IBOutlet weak var ziara3Button: UIButton!
    @IBOutlet weak var withYouButton: UIButton!
    
    
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
        
        ziara1Button.layer.cornerRadius = 25;
        ziara2Button.layer.cornerRadius = 25;
        ziara3Button.layer.cornerRadius = 25;
        
        withYouButton.layer.cornerRadius = 25;
    }
    
    @IBAction func gotoMapAction(_ sender: Any)
    {
        let button = sender as! UIButton;
        gotoMap(category: button.tag);
    }
    
    func gotoMap(category : Int?)
    {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "NearestPlaceViewController") as! NearestPlaceViewController;
        controller.category = category;
        present(controller, animated: true, completion: nil);
    }
    
    @IBAction func openWithYouApp(_ sender: Any)
    {
        if let url = URL(string: "https://itunes.apple.com/us/app/%D8%A7%D9%86%D8%A7-%D9%85%D8%B9%D9%83%D9%85/id1172405052"),
            UIApplication.shared.canOpenURL(url)
        {
            UIApplication.shared.openURL(url)
        }
    }
}



