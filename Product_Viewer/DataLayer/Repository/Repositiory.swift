//
//  Repositiory.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation



class Repository : BaseRepository {
    
    var localDataSource : getFromLocalProtocol
    var remoteDataSource : fetchFromServerProtocol
    
    
    init(localDataSource: getFromLocalProtocol, remoteDataSource: fetchFromServerProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchProducts() {
        // if internetConnectionEnabled fetch from remote
        remoteDataSource.fetchAllProducts(completion: { result in
            let result = try? result.get()
            print(result)
        })
        // else locally
//        localDataSource.getAllProducts()
    }
    
    
}
