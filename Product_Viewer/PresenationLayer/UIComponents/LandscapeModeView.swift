//
//  LandscapeModeView.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import SwiftUI

struct LandscapeModeView: View {
    var body: some View {
        HStack{
            Spacer()
            Text("product Name ")
                .lineLimit(1)
                .font(.system(size: 20))
                .minimumScaleFactor(0.5)
            Spacer()
            Image(systemName: "house")
                .foregroundColor(.blue)
          
     
            Spacer()
        }
    }
}

struct LandscapeModeView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeModeView()
    }
}
