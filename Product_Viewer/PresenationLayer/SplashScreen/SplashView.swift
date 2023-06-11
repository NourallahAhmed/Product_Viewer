//
//  ContentView.swift
//  Product_Viewer
//
//  Created by NourAllah on 08/06/2023.
//

import SwiftUI
import CoreData
import Lottie

struct SplashScreen: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var navigateToNextView = false
//    var remoteDataSource = RemoteDataSource()
//    var localDataSource = LocalDataSource()
//    var baseRepo = Repository(localDataSource:  LocalDataSource() , remoteDataSource: RemoteDataSource())
    var homeViewModel = HomeViewModel(
        getProductsUseCase:
            GetProductUseCase(
                baseRepository:
                    Repository(
                        localDataSource: LocalDataSource() ,
                        remoteDataSource: RemoteDataSource()))
            )
    
    var body: some View {
        NavigationView{
            ZStack{
                LottieView(filename: "splash" , loopMode: .playOnce)
                NavigationLink(
                    destination:   HomeScreenView(viewModel: homeViewModel)
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
        SplashScreen()
            //.environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
