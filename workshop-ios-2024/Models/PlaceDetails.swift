//
//  PlaceDetail.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import Foundation


class PlaceDetails
{
    
    let id: String
    let name: String
    let image: String?
    let description: String
    let address: String
    let latitude: Double
    let longitude: Double
    let kinds: [String]
    let wikipedia:String?
    
    init(id: String, name: String, image: String?, description: String, address: String, latitude: Double, longitude: Double, kinds: [String],wikipedia:String?) {
        self.id = id
        self.name = name
        self.image = image
        self.description = description
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.kinds = kinds
        self.wikipedia = wikipedia
    }
    
}
