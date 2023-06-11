//
//  ConvertToProducts.swift
//  Product_Viewer
//
//  Created by NourAllah on 11/06/2023.
//

import Foundation

extension LocalProducts {
    func toProducts() -> Product{
        
        print("ID = \(self.id)")
        print("ID = \(self.name)")
        return Product(id: UUID().description ,
                       name: self.name,
                       description: self.discriptions,
                       price: self.price,
                       imageURL: self.image_URL)
    }
}
