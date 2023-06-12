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
    
    func getData(completionHandler: @escaping (Result<[Product]?, String>) -> Void) {
        baseRepository.fetchProducts { products in
            
            switch products {
            case .success(let products):
                print("GetProductUseCase = \(products)")
                completionHandler(.success(products))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    
}
