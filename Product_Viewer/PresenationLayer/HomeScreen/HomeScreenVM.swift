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
    
    init(getProductsUseCase: GetProductUseCase) {
        self.getProductsUseCase = getProductsUseCase
        self.getProductsUseCase.getData { products in
            self.products = products
            self.loading = false

        }
    }
}
