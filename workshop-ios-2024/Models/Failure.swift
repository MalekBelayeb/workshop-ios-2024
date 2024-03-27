//
//  Failure.swift
//  workshop-ios-2024
//
//  Created by ODC on 23/3/2024.
//

import Foundation


class Failure:Error
{
    
    let message:String
    init(message: String) {
        self.message = message
    }
    
}
