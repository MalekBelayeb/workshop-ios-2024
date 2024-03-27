//
//  Consts.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import Foundation


class Consts
{
    
    static let URL = "https://api.opentripmap.com/0.1/en/places/"
    static let API_KEY = "5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9"
    static let GET_ALL_PALCES =  "\(URL)radius?apikey=\(API_KEY)&format=json"
    static let PLACE_DETAILS = "\(URL)xid/"
    
    
    
}


