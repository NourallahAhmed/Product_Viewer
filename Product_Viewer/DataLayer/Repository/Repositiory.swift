//
//  Repositiory.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation

import Network

class Repository : BaseRepository {
    
    var localDataSource : getFromLocalProtocol
    var remoteDataSource : fetchFromServerProtocol
    
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    let monitor = NWPathMonitor()
    
    init(localDataSource: getFromLocalProtocol, remoteDataSource: fetchFromServerProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchProducts(completionHandeler :  @escaping ([ProductViewer]) -> Void) {        
        monitor.pathUpdateHandler = { [weak self] pathUpdateHandler  in
            if pathUpdateHandler.status == .satisfied {
                // if internetConnectionEnabled fetch from remote
                self?.remoteDataSource.fetchAllProducts(completion: { result in
                    let result = try? result.get()
                    
                    completionHandeler(result ?? [])

                })
            }else{
                // else locally
                self?.localDataSource.getAllProducts { products in
                    print(products.count)
                }
            }
            
           
        }
        monitor.start(queue: queue)
    }
}
