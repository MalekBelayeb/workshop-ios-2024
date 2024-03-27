//
//  NavigatorRouter.swift
//  workshop-ios-2024
//
//  Created by ODC on 22/3/2024.
//

import Foundation
import SwiftUI

class NavigationRouter: ObservableObject
{
    
    @Published var navPath = NavigationPath()
    
    enum Destination:Hashable
    {
        
        case home
        case details(String)
        
    }
    
    func navigateTo(destination:Destination)
    {
        
        navPath.append(destination)
        
    }
    
    func navigateBack()
    {
        
        navPath.removeLast()
        
    }
    
    func navigateToRoot()
    {
        
        navPath.removeLast(navPath.count)
        
    }
    
}
