//
//  PlaceItemView.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import SwiftUI

struct PlaceItemView: View {
    
    let placeItem:PlaceItem
    
    var body: some View {
        
        VStack(spacing:12){
            
            HStack{
                
                Text("\(placeItem.name)")
                    .font(.custom(LuckyTripFonts.robotoMedium, size: 16))
                
                Spacer()
                
                Image(systemName: "star").resizable().frame(width: 18,height: 18).highPriorityGesture(TapGesture().onEnded{
                    
                  
                    
                })
                
            }.frame(maxWidth:.infinity)
            
            HStack{
                
                ForEach(placeItem.kinds,id:\.self)
                {
                    item in
                    
                    Text("\(item)").font(.custom(LuckyTripFonts.robotoRegular, size: 10)).padding(.horizontal,8).lineLimit(1).padding(.vertical,4).background(RoundedRectangle(cornerRadius: 16).fill(.gray.opacity(0.15)))
                }
                
                Spacer()
                
                Text("\(String(format: "%.1f m", placeItem.distance))")
                    .font(.custom(LuckyTripFonts.robotoRegular, size: 14))
              
            }.frame(maxWidth:.infinity)
            
        }
        
    }
    
}

#Preview {
    PlaceItemView(placeItem: PlaceItem(id: "", name: "El Kobba Museum", distance: 300, rate: 5, kinds: ["museums","cultural","interesting_places"]))
}
