//
//  workshop_ios_2024App.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import SwiftUI
import SwiftData

@main
struct workshop_ios_2024App: App {
    
    @StateObject var navigationRouter: NavigationRouter = NavigationRouter()
    @StateObject var locationManager: LocationManger = LocationManger()

    @StateObject var homeViewModel : HomeViewModel = HomeViewModel(placeListDataMapper: PlaceListDataMapper())
    
    @StateObject var placeDetailsViewModel : PlaceDetailsViewModel = PlaceDetailsViewModel(placeDetailsDataMapper: PlaceDetailsDataMapper())
    
    var body: some Scene {
    
        WindowGroup {
            
            NavigationStack(path: self.$navigationRouter.navPath)
            {
                
                HomeView().onAppear{
                    
                    for family in UIFont.familyNames {
                             print(family)
                             for names in UIFont.fontNames(forFamilyName: family){
                             print("== \(names)")
                             }
                        }
                    
                }.navigationDestination(for: NavigationRouter.Destination.self)
                {
                    destination in
                    
                    if destination == .home
                    {
                        
                        HomeView()
                        
                    }else if case let .details(id) = destination
                    {
                        
                        PlaceDetailsView(id: id)
                        
                    }
                    
                }
                
                
            }
            .environmentObject(self.navigationRouter)
            .environmentObject(self.homeViewModel)
            .environmentObject(self.placeDetailsViewModel)
            .environmentObject(self.locationManager)

            
        }
        
    }
    
}
