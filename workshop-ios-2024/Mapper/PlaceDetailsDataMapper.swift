//
//  PlaceDetailsDataMapper.swift
//  workshop-ios-2024
//
//  Created by ODC on 23/3/2024.
//

import Foundation


class PlaceDetailsDataMapper
{
    
    let placeDatasource: PlaceDatasource = PlaceDatasource()
    
    func getPlaceDetails(id:String) async -> Result<PlaceDetails,Failure>
    {
        
        let result = try? await self.placeDatasource.getPlaceDetails(url: "\(Consts.PLACE_DETAILS)\(id)?apikey=\(Consts.API_KEY)")
        
        if let result = result as? PlaceDetailsResponse
        {
            
            return .success(PlaceDetails(id: result.xid, name: result.name, image: result.preview?.source, description: result.wikipedia_extracts?.text ?? "", address: "\(result.address.city ?? ""), \(result.address.state ?? ""), \(result.address.county ?? ""), \(result.address.country ?? "")", latitude: result.point.lat, longitude: result.point.lon, kinds: result.kinds.split(separator: ",").prefix(3).map{ String($0) },wikipedia: result.wikipedia ))
            
        }else{
            
            return .failure(Failure(message: "Server error please try again later"))
            
        }
        
        
    }
    
}
