//
//  MapViewController.swift
//  Mashay
//
//  Created by AliMac on 10/17/17.
//  Copyright © 2017 TurathAlanbiaa. All rights reserved.
//

import UIKit
import Mapbox

class MapViewController: UIViewController , MGLMapViewDelegate
{
    
    var category : Int?;
    
    @IBOutlet weak var mapContainer: UIView!
    var mapView: MGLMapView!
    var progressView: UIProgressView!
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        mapView = MGLMapView(frame: mapContainer.bounds, styleURL: MGLStyle.darkStyleURL())
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.tintColor = .gray
        mapView.delegate = self
        mapContainer.addSubview(mapView)

        mapView.setCenter(CLLocationCoordinate2D(latitude: 32.320, longitude: 44.269),
                          zoomLevel: 9.5, animated: false)
        
        // Setup offline pack notification handlers.
        NotificationCenter.default.addObserver(self, selector: #selector(offlinePackProgressDidChange), name: NSNotification.Name.MGLOfflinePackProgressChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(offlinePackDidReceiveError), name: NSNotification.Name.MGLOfflinePackError, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(offlinePackDidReceiveMaximumAllowedMapboxTiles), name: NSNotification.Name.MGLOfflinePackMaximumMapboxTilesReached, object: nil)
        
        displayAnnotations();

    }
    
    func displayAnnotations()
    {
        let places = Place.getPlacesByCategory(category: self.category!);
        for place : Place in places
        {
            let annotation = MGLPointAnnotation();
            annotation.coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude);
            annotation.title = place.title;
            annotation.subtitle = String("عامود رقم") + String(place.colNo);
            mapView.addAnnotation(annotation);
        }
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView)
    {
        startOfflinePackDownload()
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    func startOfflinePackDownload()
    {
        let region = MGLTilePyramidOfflineRegion(styleURL: mapView.styleURL, bounds: mapView.visibleCoordinateBounds, fromZoomLevel: mapView.zoomLevel, toZoomLevel: 14)
        
        let userInfo = ["name": "My Offline Pack"]
        let context = NSKeyedArchiver.archivedData(withRootObject: userInfo)
        
        
        MGLOfflineStorage.shared().addPack(for: region, withContext: context)
        {
            (pack, error) in
            guard error == nil else
            {
                if(self.progressView != nil)
                {
                    self.progressView.isHidden = true;
                }
            
                print("Error: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            pack!.resume()
        }
        
    }
    
    
    @objc func offlinePackProgressDidChange(notification: NSNotification)
    {
        if  let pack = notification.object as? MGLOfflinePack,
            let userInfo = NSKeyedUnarchiver.unarchiveObject(with: pack.context) as? [String: String]
        {
            let progress = pack.progress
            let completedResources = progress.countOfResourcesCompleted
            let expectedResources = progress.countOfResourcesExpected
            
            let progressPercentage = Float(completedResources) / Float(expectedResources)
            
            // Setup the progress bar.
            if progressView == nil
            {
                progressView = UIProgressView(progressViewStyle: .default)
                let frame = view.bounds.size
                progressView.frame = CGRect(x: frame.width / 4, y: frame.height * 0.75, width: frame.width / 2, height: 10)
                view.addSubview(progressView)
            }
            
            progressView.progress = progressPercentage
            
            if completedResources == expectedResources
            {
                self.progressView.isHidden = true;
                let byteCount = ByteCountFormatter.string(fromByteCount: Int64(pack.progress.countOfBytesCompleted), countStyle: ByteCountFormatter.CountStyle.memory)
                print("Offline pack “\(userInfo["name"] ?? "unknown")” completed: \(byteCount), \(completedResources) resources")
            }
            else
            {
                // Otherwise, print download/verification progress.
                print("Offline pack “\(userInfo["name"] ?? "unknown")” has \(completedResources) of \(expectedResources) resources — \(progressPercentage * 100)%.")
            }
        }
    }
    
    @objc func offlinePackDidReceiveError(notification: NSNotification)
    {
        if let pack = notification.object as? MGLOfflinePack,
            let userInfo = NSKeyedUnarchiver.unarchiveObject(with: pack.context) as? [String: String],
            let error = notification.userInfo?[MGLOfflinePackUserInfoKey.error] as? NSError
        {
            if(self.progressView != nil)
            {
                self.progressView.isHidden = true;
            }
            
            print("Offline pack “\(userInfo["name"] ?? "unknown")” received error: \(error.localizedFailureReason ?? "unknown error")")
        }
    }
    
    @objc func offlinePackDidReceiveMaximumAllowedMapboxTiles(notification: NSNotification)
    {
        if let pack = notification.object as? MGLOfflinePack,
            let userInfo = NSKeyedUnarchiver.unarchiveObject(with: pack.context) as? [String: String],
            let maximumCount = (notification.userInfo?[MGLOfflinePackUserInfoKey.maximumCount] as AnyObject).uint64Value
        {
            if(self.progressView != nil)
            {
                self.progressView.isHidden = true;
            }
            
            print("Offline pack “\(userInfo["name"] ?? "unknown")” reached limit of \(maximumCount) tiles.")
        }
    }
    
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage?
    {
        var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: "annotation")
        if annotationImage == nil
        {
            var image = UIImage(named: "blue_place")!
            image = image.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: image.size.height/2, right: 0))
            annotationImage = MGLAnnotationImage(image: image, reuseIdentifier: "annotation")
        }
        
        return annotationImage
    }

    @IBAction func dismiss(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil);
    }
    
}

