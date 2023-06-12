//
//  DetailsScreenView.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import SwiftUI

struct DetailsScreenView: View {
    @State var orientation = UIDevice.current.orientation
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var product : Product
    
    var body: some View {
        ZStack{
            if orientation.isLandscape {
                LandscapeModeView(product: product)
            }
            else{
                PortraitModeView(product: product)
            }
            
        }.onAppear{
            self.orientation = UIDevice.current.orientation

        }
        .onReceive(orientationChanged) { _ in
            self.orientation = UIDevice.current.orientation
            
            
        }
    }
}

struct DetailsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreenView(product: Product(id: "", name: "", description: "", price: "", imageURL: "" ))
    }
}
