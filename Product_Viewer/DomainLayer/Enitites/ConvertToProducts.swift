//
//  ConvertToProducts.swift
//  Product_Viewer
//
//  Created by NourAllah on 11/06/2023.
//

import Foundation

extension LocalProducts {
    func toProducts() -> Product{

        return Product(id: self.productID ,
                       name: self.name,
                       description: self.discriptions,
                       price: self.price,
                       imageURL:  self.image_URL )
    }
}
