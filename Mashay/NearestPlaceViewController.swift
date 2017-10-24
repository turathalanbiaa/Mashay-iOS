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
    
    @IBOutlet weak var showMapButton: UIButton!
    var category : Int?;
    let locationManager = CLLocationManager();
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        showMapButton.layer.cornerRadius = 20;
        
        locationManager.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = manager.location?.coordinate
        
        print("locations = \(String(describing: location?.latitude)) \(String(describing: location?.longitude))")
        
        let nearestPlace = Place.nearestPlace(longitude: (location?.longitude)!, latitude: (location?.latitude)! , category : self.category!);
        
        titleLabel.text = nearestPlace.title;
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .right;
        colNoLabel.text = String(nearestPlace.colNo);
        
        locationManager.stopUpdatingLocation();
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        titleLabel.text = "لم يتمكن من ايجاد الموقع"
        colNoLabel.text = "غير معروف"
    }

    

    @IBAction func showMapAction(_ sender: Any)
    {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let controller = mainStoryboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController;
        controller.category = self.category;
        self.present(controller, animated: true, completion: nil);
    }
    
    @IBAction func dismiss(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil);
    }
    
}
