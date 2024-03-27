//
//  HomeViewModel.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import Foundation
import SwiftUI
import CoreLocation


class HomeViewModel: ObservableObject
{
    
    let placeListDataMapper:PlaceListDataMapper
    
    init(placeListDataMapper: PlaceListDataMapper) {
        self.placeListDataMapper = placeListDataMapper
    }
    
    @AppStorage("range") var range:Double = 5000
    
    @Published var getAllPlacesState : GetAllPlacesState = .loading
    
    var myLastLocation:CLLocationCoordinate2D?
    var deviceLocation : CLLocationCoordinate2D?
    
    func setDeviceLocation(location: CLLocationCoordinate2D)
    {
        self.deviceLocation = location
    }
    
    func getAllPlaces(location: CLLocationCoordinate2D? = nil )
    {
            
        Task{
            
            let myLocation: CLLocationCoordinate2D

            if let location = location
            {
                
                self.myLastLocation = location
                myLocation = location
                
            }else{

                guard let deviceLocation = deviceLocation else { return }
                myLocation = deviceLocation
                
            }
            
            DispatchQueue.main.async {
                self.getAllPlacesState = .loading
            }
            
            let result = await placeListDataMapper.getAllPlaces(range: range,latitude: myLocation.latitude,longitude: myLocation.longitude)

            if case let .success(places) = result
            {
                DispatchQueue.main.async {
                    self.getAllPlacesState = .success( places )
                }
                
            }else if case let .failure(failure) = result {

                DispatchQueue.main.async {
                    self.getAllPlacesState = .error(failure.message)
                }
                
            }
            
        }
        
        
    }
    
}
