//
//  LocalDataSource.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation




protocol getFromLocalProtocol{
    func getAllProducts(completionHandler : @escaping (([LocalProducts]) -> Void))
}

class LocalDataSource  : getFromLocalProtocol {

    func getAllProducts(completionHandler: @escaping (([LocalProducts]) -> Void)) {
        let localProducts =   PersistenceController.shared.fetchItems()
        
        completionHandler(localProducts)
    }
    
    
}
