//
//  HomeScreenVM.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation
import Network
class HomeViewModel : ObservableObject {
    
    var getProductsUseCase : GetProductUseCase
    
    @Published var products : [Product] = []
    @Published var loading : Bool = true
    @Published var error : String = ""
    @Published var isInternetConnectionEnabled : Bool =  true
    init(getProductsUseCase: GetProductUseCase ) {
        self.getProductsUseCase = getProductsUseCase
        checkConnection()
        //After 6 sec to show the loading lottie 
        DispatchQueue.global().asyncAfter(deadline: .now() + 6){
            self.getProductsUseCase.getData { result in
                switch result {
                case .success(let product):
                    DispatchQueue.main.async {
                        self.products = product ?? []
                        self.loading = false
                    }
                case .failure(let error) :
                    DispatchQueue.main.async {
                        self.loading = false
                        self.error = error
                    }
                }
            }
        }
    }
    
    
    func checkConnection(){
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { [weak self] pathUpdateHandler  in
            self?.isInternetConnectionEnabled =  pathUpdateHandler.status == .satisfied
        }
        monitor.start(queue: queue)
    }
}
