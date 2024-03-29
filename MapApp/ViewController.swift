//
//  ViewController.swift
//  MapApp
//
//  Created by Rachana Pandey on 11/17/15.
//  Copyright © 2015 anarach. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    var manager:CLLocationManager!

    @IBOutlet var LatitudeLabel: UILabel!
    
    @IBOutlet var LongitudeLabel: UILabel!
    
    
    @IBOutlet var courseLabel: UILabel!
    
    @IBOutlet var speedLabel: UILabel!
    
    @IBOutlet var AltitudeLabel: UILabel!
    
    @IBOutlet var AdressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy - kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

    
    
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        var userLocation:CLLocation = locations[0]
       self.LatitudeLabel.text =  "\(userLocation.coordinate.latitude)"
        self.LongitudeLabel.text = "\(userLocation.coordinate.longitude)"
        self.courseLabel.text = "\(userLocation.course)"
        self.speedLabel.text = "\(userLocation.speed)"
        self.AltitudeLabel.text = "\(userLocation.altitude)"
        
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) -> Void in
            if(error != nil){
                print(error)
            }
            else {
            
                if let p = placemarks?[0] {
                    
                    var subThoroughfare:String = ""
                    
                    if(p.subThoroughfare != nil){
                    
                    subThoroughfare = p.subThoroughfare!
                    
                    }
                    self.AdressLabel.text = "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \n \(p.country)"
                }
            
            
            }
        }
        
     
        
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

