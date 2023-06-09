//
//  LocalDataSource.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation
/*
    dealing with CoreData
 
 */
protocol getFromLocalProtocol{
   func getAllProducts()
}

class LocalDataSource  : getFromLocalProtocol {
    func getAllProducts() {
    }
}
