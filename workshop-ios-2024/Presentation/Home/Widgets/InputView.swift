//
//  InputView.swift
//  workshop-ios-2024
//
//  Created by ODC on 22/3/2024.
//

import SwiftUI


//orangedev.center.marsa@gmail.com
//Odc@1234


struct InputView: View {
    
    @Binding var searchValue : String
    
    var body: some View {
        
        TextField("Search", text: $searchValue).textFieldStyle(.roundedBorder).font(.custom(LuckyTripFonts.robotoRegular, size: 12))
        
    }
}

#Preview {
    InputView(searchValue: .constant(""))
}
