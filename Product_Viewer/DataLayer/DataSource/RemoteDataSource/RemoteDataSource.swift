//
//  RemoteDataSource.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation

protocol fetchFromServerProtocol {
    func fetchAllProducts( completion: @escaping(Result<[ProductViewer]?, NSError>) -> Void)
}

protocol storeLocallyProtocol {
    func storeProductLocaly()
}




class RemoteDataSource   : BaseAPI<NetworkRequest> ,fetchFromServerProtocol {
    func fetchAllProducts(completion: @escaping (Result<[ProductViewer]?, NSError>) -> Void) {
        self.fetchData(target: .getProducts, responseClass: [ProductViewer].self) { (result) in            
            completion(result)
        }
    }
    
  
    
    
}


extension RemoteDataSource : storeLocallyProtocol {
    func storeProductLocaly() {
        //after get data store it in coredata
    }
    
    
}
