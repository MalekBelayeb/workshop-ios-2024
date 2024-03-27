//
//  PlaceMapper.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import Foundation


class PlaceListDataMapper
{
    
    let placeDatasource:PlaceDatasource = PlaceDatasource()
        
    func getAllPlaces(range:Double,latitude:Double,longitude:Double) async -> Result<[PlaceItem],Failure>
    {
        
        let result = try? await placeDatasource.getAllPlaces(url: "\(Consts.GET_ALL_PALCES)&radius=\(range)&lon=\(longitude)&lat=\(latitude)")
        
        if let result = result as? [PlaceResponse]
        {
            
            return .success(result.map {
                item in
                
                return PlaceItem(id: item.xid, name: item.name, distance: item.dist, rate: item.rate, kinds: item.kinds.split(separator: ",").prefix(3).map{ String($0) })
             })
            
        }else{
            
            return .failure(Failure(message: "Server error please try again later"))
            
        }
        
    }
    
}
