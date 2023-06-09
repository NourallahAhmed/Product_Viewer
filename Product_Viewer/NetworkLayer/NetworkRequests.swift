//
//  NetworkRequests.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation
import Alamofire
/*
 genernic if project expanded put any network request here
 Like:
    getProductByID(ID:String)
    
 */
enum NetworkRequest{
    case getProducts
}

extension NetworkRequest : TargetType {
    var baseURL: String {
        switch self {
         
        case .getProducts :
            return Constants.baseURL
            
        default :
            return Constants.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return "/wp-content/uploads/2012/09/featured.txt"
       
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    var task: Task {
        switch self {

            
        case .getProducts:
            return .requestPlain

        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getProducts:
            return ["":""]
        default:
            return [:]
        }
    }
    
}
