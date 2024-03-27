//
//  HomeView.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    
    @State var selectedOption : PickerOption = PickerOption(name: "My Location",latitude: nil,longitude: nil)
    
    @State var searchValue : String = ""
    
    @State var showBottomSheet:Bool = false
    
    @State var rangeSlider : Double = 0
    
    @EnvironmentObject var locationManager: LocationManger

    @EnvironmentObject var navigationRouter: NavigationRouter
    @EnvironmentObject var homeViewModel : HomeViewModel
    
    var body: some View {
        
        GeometryReader
        {
            geo in
            
            VStack(spacing:24)
            {
             
                HStack{
                    
                    Button
                    {
                        
                        self.showBottomSheet = true
                        
                    }label: {
                        
                        Image(systemName: "gearshape.fill").resizable().frame(width: 18,height: 18)
                        
                    }.buttonStyle(.plain)
                    
                }.frame(maxWidth:.infinity,alignment:.trailing)
                
                HStack
                {
                 
                    InputView(searchValue: $searchValue)
                    
                }
                
                if .loading == self.homeViewModel.getAllPlacesState{


                    ProgressView().progressViewStyle(.circular)

                    
                } else if case let .success(places) = self.homeViewModel.getAllPlacesState
                {
                    
                    HStack(alignment:.bottom)
                    {
                        
                        VStack(alignment:.leading,spacing:4)
                        {
                            
                            Text("Recent Places (\(places.count))").font(.custom(LuckyTripFonts.robotoMedium, size: 18)).foregroundStyle(Color.black)
                            
                            Text("Range : \(String(format: "%.1f m",self.homeViewModel.range))").font(.custom(LuckyTripFonts.robotoMedium, size: 12)).foregroundStyle(Color.gray)
                            
                        }
                        
                        Spacer()
                        
                        PickerView(selection: $selectedOption)
                        
                    }.frame(maxWidth: .infinity,alignment:.leading)
                    
                    ScrollView(showsIndicators:false)
                    {
                        
                        LazyVStack(spacing:16){
                        
                            ForEach(places,id:\.id)
                            {
                                item in
                               
                                Button{
                                    
                                    self.navigationRouter.navigateTo(destination: .details(item.id))
                                    
                                }label: {
                                    
                                    PlaceItemView(placeItem: item)
                                    
                                }.buttonStyle(.plain)
                                
                                Divider()

                            }
                            
                        }
                        
                    }
                    
                }else{
                    
                    Spacer()
                    
                }
                
                
            }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment:.top).sheet(isPresented: self.$showBottomSheet,onDismiss: {
                
                self.homeViewModel.getAllPlaces()
                
            }){
                
                VStack(alignment:.leading,spacing: 32)
                {
                 
                    Text("Change Range Distance").font(.custom(LuckyTripFonts.robotoMedium, size: 16))
                    
                    VStack
                    {
                        
                        HStack
                        {
                        
                            Text("\(String(format: "%.1f m", self.homeViewModel.range))").font(.custom(LuckyTripFonts.robotoRegular, size: 12)).foregroundStyle(.gray)
                            
                        }.frame(maxWidth:.infinity,alignment:.trailing)
                        
                        Slider(value: self.$homeViewModel.range, in: 0...5000).tint(.black)
                        
                    }
                    
                    HStack
                    {
                        
                        Button
                        {
                            
                            self.showBottomSheet = false
                            
                        }label: {
                            Text("Confirm").font(.custom(LuckyTripFonts.robotoRegular, size: 14))
                        }
                        
                    }.frame(maxWidth:.infinity,alignment:.trailing)
                    
                }.frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.topLeading).padding(16).presentationDetents([.height(geo.size.height * 0.25)])
                
            }.padding([.bottom,.horizontal],16).padding(.top,32).onAppear
            {
                
                self.locationManager.requestAuthorization()
                
            }.onReceive(self.locationManager.$lastUpdateLocation){
                
                myCoordinate in
                
                guard let myCoordinate = myCoordinate else { return }
                self.homeViewModel.setDeviceLocation(location: myCoordinate)
                self.homeViewModel.getAllPlaces()
                
            }.onChange(of: self.selectedOption)
            {
                selectedPlace in
                
                if let latitude = selectedOption.latitude, let longitude = selectedOption.longitude
                {
                    self.homeViewModel.getAllPlaces(location: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                    
                }else{
                    
                    self.homeViewModel.getAllPlaces()
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    HomeView()
}
