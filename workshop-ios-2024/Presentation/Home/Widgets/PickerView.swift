//
//  DropDownMenuView.swift
//  workshop-ios-2024
//
//  Created by ODC on 21/3/2024.
//

import SwiftUI


struct PickerOption:Hashable
{
    
    let name:String
    let latitude:Double?
    let longitude:Double?
    
}

struct PickerView: View {
    
    @Binding var selection:PickerOption

    let pickerOptions:[PickerOption] = [
        
        PickerOption(name: "My Location", latitude: nil,longitude: nil),
        PickerOption(name: "Tunis",latitude: 36.794992, longitude: 10.0608774),
        PickerOption(name: "Sousse", latitude: 35.828379, longitude: 10.5401156),
        PickerOption(name: "Sfax", latitude: 34.7614581, longitude: 10.6918991),
        PickerOption(name: "Bizerte", latitude: 37.2811055, longitude: 9.8409048),
        PickerOption(name: "Nabeul", latitude: 36.4524389, longitude: 10.6374029)
    
    ]
    
    var body: some View {
    
            Picker("", selection: $selection) {
            
                ForEach(pickerOptions, id: \.self) {
                
                    Text($0.name).tag($0)
                    
                }
                
            }.tint(.black)
            .pickerStyle(.menu)
        
    }
    
}
