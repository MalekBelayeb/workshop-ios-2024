//
//  PlaceDetailsViewModel.swift
//  workshop-ios-2024
//
//  Created by ODC on 22/3/2024.
//

import Foundation





class PlaceDetailsViewModel: ObservableObject
{
    
    let placeDetailsDataMapper : PlaceDetailsDataMapper
    
    init(placeDetailsDataMapper: PlaceDetailsDataMapper) {
        self.placeDetailsDataMapper = placeDetailsDataMapper
    }
    
    @Published var getPlaceDetailsState: GetPlaceDetailsState = .loading
    
    func getPlaceDetails(id:String)
    {
        
        Task {
            
            DispatchQueue.main.async{
                self.getPlaceDetailsState = .loading
            }
            
            let result = await placeDetailsDataMapper.getPlaceDetails(id: id)
            
            if case let .success(placeDetails) = result
            {
                DispatchQueue.main.async {

                    self.getPlaceDetailsState = .success(placeDetails)
                }
                
            }else if case let .failure(failure) = result {
                
                DispatchQueue.main.async {
                    self.getPlaceDetailsState = .error(failure.message)
                }
                
            }
            
        }
        
    }
    
    
}
