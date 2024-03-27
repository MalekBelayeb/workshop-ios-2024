//
//  LocationManager.swift
//  workshop-ios-2024
//
//  Created by ODC on 25/3/2024.
//

import Foundation
import CoreLocation

class LocationManger: NSObject, ObservableObject, CLLocationManagerDelegate
{
    
    let locationManager = CLLocationManager()
    @Published var lastUpdateLocation:CLLocationCoordinate2D?
    
    override init()
    {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = CLLocationDistance(1000)
        
    }
 
    
    func requestAuthorization()
    {
        
        if self.locationManager.authorizationStatus == .notDetermined
        {
            
            self.locationManager.requestWhenInUseAuthorization()
            
        }else if self.locationManager.authorizationStatus == .authorizedWhenInUse {
            
            self.locationManager.startUpdatingLocation()
            
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if manager.authorizationStatus == .authorizedWhenInUse
        {
            manager.requestLocation()
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let coordinate = locations.last?.coordinate else { return }
        self.lastUpdateLocation = coordinate
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
