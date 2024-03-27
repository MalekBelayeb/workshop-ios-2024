//
//  GetAllPlacesState.swift
//  workshop-ios-2024
//
//  Created by ODC on 23/3/2024.
//

import Foundation

enum GetAllPlacesState:Equatable
{
    
    case loading
    case success([PlaceItem])
    case error(String)
    
}
