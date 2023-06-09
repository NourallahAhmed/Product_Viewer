//
//  PortraitModeView.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import SwiftUI

struct PortraitModeView: View {
        var body: some View {
            
            VStack{
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

struct PortraitModeView_Previews: PreviewProvider {
    static var previews: some View {
        PortraitModeView()
    }
}
