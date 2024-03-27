//
//  PlaceItem.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import Foundation


class PlaceItem:Equatable
{
    
    static func == (lhs: PlaceItem, rhs: PlaceItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id:String
    let name:String
    let distance:Double
    let rate:Double
    let kinds:[String]
    
    init(id: String, name: String, distance: Double, rate: Double, kinds: [String]) {
        self.id = id
        self.name = name
        self.distance = distance
        self.rate = rate
        self.kinds = kinds
    }
    
}
