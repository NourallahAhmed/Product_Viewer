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
    var body: some View {
        ZStack{
            if orientation.isLandscape {
                LandscapeModeView()
            }
            else{
                PortraitModeView()
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
        DetailsScreenView()
    }
}
