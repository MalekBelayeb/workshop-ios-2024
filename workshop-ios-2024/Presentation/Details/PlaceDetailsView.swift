//
//  PlaceDetailsView.swift
//  workshop-ios-2024
//
//  Created by ODC on 22/3/2024.
//

import SwiftUI

struct PlaceDetailsView: View {
        
    let id:String 
    
    @EnvironmentObject var placeDetailsViewModel : PlaceDetailsViewModel

    @State var showWebView : Bool = false

    var body: some View {
        
        VStack(spacing:32)
        {
            
            if case .loading = self.placeDetailsViewModel.getPlaceDetailsState
            {
            
                Spacer()
                ProgressView().progressViewStyle(.circular)
                Spacer()
                
            }else if case let GetPlaceDetailsState.success(placeDetails) = self.placeDetailsViewModel.getPlaceDetailsState
            {
            
                if let image = placeDetails.image, let imgUrl = URL(string: image)
                {
                    
                    AsyncImage(url: imgUrl){
                        image in
                        
                        image.image?.resizable().aspectRatio(contentMode: .fit)
                        
                    }.frame(maxWidth: .infinity,maxHeight: 300)

                }
                
                VStack(alignment: .leading,spacing:16)
                {
                    
                    HStack{
                        
                        Spacer()
                        
                        Image(systemName: "star").resizable().frame(width: 24,height: 24).highPriorityGesture(TapGesture().onEnded{
                            
                            
                            
                        })
                        
                    }
                    
                    VStack(alignment: .leading,spacing:8)
                    {
                        
                        Text("\(placeDetails.name)").font(.custom(LuckyTripFonts.robotoMedium, size: 18)).lineLimit(4)
                        
                        Text("\(placeDetails.address)").font(.custom(LuckyTripFonts.robotoMedium, size: 12)).lineLimit(4).foregroundStyle(.gray)
                        
                    }
                    
                    Text("\(placeDetails.description)").font(.custom(LuckyTripFonts.robotoRegular, size: 14)).lineLimit(32)
               
                }
                
                Spacer()
                
                HStack
                {
                    
                    Spacer()
                    
                    Button
                    {
                        
                        self.showWebView = true

                    }label: {
                    
                        Text("Visit Wikipedia Page").font(.custom(LuckyTripFonts.robotoMedium, size: 14)).foregroundStyle(.blue)
                    }
                    
                    
                }.frame(maxWidth: .infinity)
                
            }
            
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).padding(16).onAppear
        {

            self.placeDetailsViewModel.getPlaceDetails(id: self.id)
            
        }.sheet(isPresented: self.$showWebView)
        {
            if case let GetPlaceDetailsState.success(placeDetails) = self.placeDetailsViewModel.getPlaceDetailsState,let wikipediaUrl = placeDetails.wikipedia, let url = URL(string: wikipediaUrl)
            {
                WebView(url: url) 
                    .ignoresSafeArea()
                    .navigationBarTitleDisplayMode(.inline)
            }
            
        }
        
    }
}

