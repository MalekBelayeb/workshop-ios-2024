//
//  TripResponse.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import Foundation

struct PlaceCoordinateResponse: Decodable
{
    
    let lon:Double
    let lat:Double
    
}

struct PlaceResponse: Decodable
{
 
    let xid:String
    let name:String
    let dist:Double
    let rate:Double
    let kinds:String
    let point:PlaceCoordinateResponse
    
}
