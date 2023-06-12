//
//  ResultEnum.swift
//  Product_Viewer
//
//  Created by NourAllah on 13/06/2023.
//

import Foundation

enum Result<T, U> {
    case success(T)
    case failure(U)
}
