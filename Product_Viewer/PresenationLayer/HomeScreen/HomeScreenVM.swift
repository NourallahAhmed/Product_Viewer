//
//  HomeScreenVM.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation
class HomeViewModel : ObservableObject {
    
    var baseRepository : BaseRepository
    
    init(baseRepository: BaseRepository) {
        self.baseRepository = baseRepository
        
        
        self.baseRepository.fetchProducts()
    }
}
