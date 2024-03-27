//
//  PlaceService.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import Foundation


class PlaceDatasource
{
    
    func getAllPlaces(url:String) async throws -> Any?
    {
        
        guard let url = URL(string: url) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = ["Content-Type":"application/json"]
        
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        if let response = (response as? HTTPURLResponse)
        {
            
            if response.statusCode == 200
            {
                    
                return try JSONDecoder().decode([PlaceResponse].self, from: data)
                
            }else{
                
                return nil
                
            }
            
        }else{
            
            return nil
        }
        
        
    }
    
    func getPlaceDetails(url:String) async throws -> Any?
    {
        
        guard let url = URL(string: url) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = ["Content-Type":"application/json"]
        
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        if let response = (response as? HTTPURLResponse)
        {
         
            if response.statusCode == 200
            {
                        
                do
                {

                    return try JSONDecoder().decode(PlaceDetailsResponse.self, from: data)
                    
                }catch
                {
                    print(error)
                    return nil
                }
                
            }else{
                
                return nil
                
            }
            
        }else{
            
            return nil
        }
        
        
        
    }
    
    
}
