//
//  getProductFromLocalUseCase.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation


class GetProductUseCase   {
    
    
    //instance from repositiory
    var baseRepository : BaseRepository
    init(baseRepository: BaseRepository) {
        self.baseRepository = baseRepository
    }
    
    func getData(completionHandler: @escaping ([Product]) -> Void) {
        baseRepository.fetchProducts { products in
            completionHandler(products)
        }
    }
    
    
    
}
