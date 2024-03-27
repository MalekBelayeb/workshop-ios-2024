//
//  PlaceDetailsResponse.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import Foundation



struct PlaceDetailsCoordinateResponse: Decodable
{
    
    let lon:Double
    let lat:Double
    
}

struct PlaceDetailsImageReponse : Decodable
{
    let source:String
}

struct PlaceDetailsDescriptionReponse : Decodable
{
    
    let text:String
}


struct PlaceDetailsAddressResponse:Decodable
{
    
    let city : String?
    let state : String?
    let county : String?
    let suburb : String?
    let country : String?
    
}

struct PlaceDetailsResponse: Decodable
{
    
    let xid : String
    let name : String
    let kinds: String
    let wikipedia: String?
    let address: PlaceDetailsAddressResponse
    let preview:PlaceDetailsImageReponse?
    let wikipedia_extracts : PlaceDetailsDescriptionReponse?
    let point: PlaceDetailsCoordinateResponse
    
}
