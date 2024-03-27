//
//  GetPlaceDetailsState.swift
//  workshop-ios-2024
//
//  Created by ODC on 25/3/2024.
//

import Foundation


enum GetPlaceDetailsState
{
    
    case loading
    case success(PlaceDetails)
    case error(String)
    
}
