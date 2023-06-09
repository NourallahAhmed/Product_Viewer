//
//  ContentView.swift
//  Product_Viewer
//
//  Created by NourAllah on 08/06/2023.
//

import SwiftUI
import CoreData
import Lottie

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var navigateToNextView = false
    var body: some View {
        NavigationView{
            ZStack{
                LottieView(filename: "splash" , loopMode: .playOnce)
                NavigationLink(
                    destination:   HomeScreenView()
                        .navigationBarHidden(true),
                    isActive: $navigateToNextView) {
                    }
                
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                self.navigateToNextView =  true
                
                }
        }
        
                  
    }


}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
