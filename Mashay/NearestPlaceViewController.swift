//
//  NearestPlaceViewController.swift
//  Mashay
//
//  Created by AliMac on 10/19/17.
//  Copyright © 2017 TurathAlanbiaa. All rights reserved.
//

import UIKit
import CoreLocation

class NearestPlaceViewController: UIViewController , CLLocationManagerDelegate
{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colNoLabel: UILabel!
    
    var category : Int?;
    var locationManager : CLLocationManager?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        locationManager?.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager?.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = manager.location?.coordinate
        print("locations = \(String(describing: location?.latitude)) \(String(describing: location?.longitude))")
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("cannot load location");
        print(error);
    }

    

    @IBAction func showMapAction(_ sender: Any)
    {
        
    }
    
    
    
    
}
