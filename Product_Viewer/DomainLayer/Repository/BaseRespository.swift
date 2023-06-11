//
//  BaseRespository.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation

protocol BaseRepository{
    func fetchProducts(completionHandeler : @escaping ([Product]) -> Void)
}
