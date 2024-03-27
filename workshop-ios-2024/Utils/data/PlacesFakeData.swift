//
//  PlacesFakeData.swift
//  workshop-ios-2024
//
//  Created by ODC on 22/3/2024.
//

import Foundation



class PlacesFakeData
{
    
    static let shared = PlacesFakeData()
    
    /*let placeDetails = PlaceDetails(id: "1", name: "Kobba museum", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Sousse_archeological_museum.JPG/300px-Sousse_archeological_museum.JPG", description: "Le phare de Sousse est un phare situé dans la kasbah de la médina de Sousse (dépendant du gouvernorat de Sousse en Tunisie) inscrit depuis 1988 au patrimoine mondial de l'Unesco.Les phares de Tunisie sont sous l'autorité du Service des phares et balises de la République tunisienne (SPHB).", address: "سوسة المدينة حي الرياض تونس", distance: 0, rate: 2, latitude: 2, longitude: 2, kinds: ["","",""])*/
    
    
    let placeList: [PlaceItem] = [
        
        PlaceItem(id: "1", name: "El Kobba Museum", distance: 300, rate: 5, kinds: ["museums","cultural","interesting_places"]),

        
        PlaceItem(id: "2", name: "El Kobba Museum", distance: 300, rate: 5, kinds: ["museums","cultural","interesting_places"]),
        
        
        PlaceItem(id: "3", name: "El Kobba Museum", distance: 300, rate: 5, kinds: ["museums","cultural","interesting_places"]),
        
        
        PlaceItem(id: "4", name: "El Kobba Museum", distance: 300, rate: 5, kinds: ["museums","cultural","interesting_places"])
        
    ]
}
