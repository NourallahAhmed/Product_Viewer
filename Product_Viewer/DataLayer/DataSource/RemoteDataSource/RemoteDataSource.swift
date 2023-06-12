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
    func storeProductLocaly(products: [ProductViewer])
}

protocol clearLocallyProtocol {
    func clearProductLocaly()
}


class RemoteDataSource   : BaseAPI<NetworkRequest> ,fetchFromServerProtocol {
    func fetchAllProducts(completion: @escaping (Result<[ProductViewer]?, NSError>) -> Void) {
        self.fetchData(target: .getProducts, responseClass: [ProductViewer].self) { (result) in

            switch result {
            case .success(let productViewer):
                let products = productViewer
                //Store new data into CoreData
                self.clearProductLocaly()
                
                self.storeProductLocaly(products:  products ?? [])
                
                //Send data to view
                completion(.success(products))
            case .failure(let error):
                completion(.failure(error))
            }
           
           
       
        }
    }
    
  
    
    
}


extension RemoteDataSource : storeLocallyProtocol {
    func storeProductLocaly(products:[ProductViewer]) {
       
        //after get data store it in coredata
        PersistenceController.shared.saveData(products: products)
        
        // to disable the nointernet lottie to be viewed and view data from DB
        UserDefaults.standard.set(false, forKey: "isFirstTime")
      
        
    }
    
    
}
extension RemoteDataSource : clearLocallyProtocol {
    func clearProductLocaly() {
        PersistenceController.shared.clearLocalData()
    }

}
