//
//  HomeScreenVM.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation
class HomeViewModel : ObservableObject {
    
    var getProductsUseCase : GetProductUseCase
    
    @Published var products : [Product] = []
    @Published var loading : Bool = true
    @Published var error : String = ""
    
    init(getProductsUseCase: GetProductUseCase) {
        self.getProductsUseCase = getProductsUseCase
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
                    self.products = []
                    self.loading = false
                    self.error = error
                }
                

            }
        }
      
    }
}
