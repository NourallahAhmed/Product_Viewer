//
//  ProductModel.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation

struct AllProducts : Codable {
    let result : [ProductViewer]
}
struct ProductViewer: Codable , Identifiable , Hashable , Equatable{
    var id = UUID()
    let product: Product
    let productMerchants: [ProductMerchantElement]

    enum CodingKeys: String, CodingKey {
        case product = "Product"
        case productMerchants = "ProductMerchants"
    }
    static func == (lhs: ProductViewer, rhs: ProductViewer) -> Bool {
        return lhs.product == rhs.product && lhs.productMerchants == rhs.productMerchants
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(product)
        hasher.combine(productMerchants)
    }

}

// MARK: - Product
struct Product: Codable , Identifiable , Hashable , Equatable {
    let id, name, description, price: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case price = "price"
        case imageURL = "image_url"
    }

    init(id: String?, name: String?, description: String?, price: String?,  imageURL: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.imageURL = imageURL
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.description == rhs.description && lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(description)
        hasher.combine(name)
    }
}

// MARK: - ProductMerchantElement
struct ProductMerchantElement: Codable , Identifiable, Hashable  {
    var id = UUID()
    
    let merchant: Merchant?
    let merchantProduct: MerchantProduct?
    let productMerchant: ProductMerchantProductMerchant?

    enum CodingKeys: String, CodingKey {
        case merchant = "Merchant"
        case merchantProduct = "MerchantProduct"
        case productMerchant = "ProductMerchant"
    }

    init(merchant: Merchant?, merchantProduct: MerchantProduct?, productMerchant: ProductMerchantProductMerchant?) {
        self.merchant = merchant
        self.merchantProduct = merchantProduct
        self.productMerchant = productMerchant
    }
    static func == (lhs: ProductMerchantElement, rhs: ProductMerchantElement) -> Bool {
        return lhs.merchant == rhs.merchant && lhs.merchantProduct == rhs.merchantProduct
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(merchant)
        hasher.combine(merchantProduct)
    }
}

// MARK: - Merchant
struct Merchant: Codable ,  Identifiable, Hashable {
    let id, name: String?

    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }
    
    
}

// MARK: - MerchantProduct
struct MerchantProduct: Codable  ,  Identifiable, Hashable {
    let id, price, upc, sku: String?
    let buyURL: String?
    let discountPercent: String?
    let unitPrice: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, price, upc, sku
        case buyURL = "buy_url"
        case discountPercent = "discount_percent"
        case unitPrice = "unit_price"
    }

    init(id: String?, price: String?, upc: String?, sku: String?, buyURL: String?, discountPercent: String?, unitPrice: JSONNull?) {
        self.id = id
        self.price = price
        self.upc = upc
        self.sku = sku
        self.buyURL = buyURL
        self.discountPercent = discountPercent
        self.unitPrice = unitPrice
    }
}

// MARK: - ProductMerchantProductMerchant
struct ProductMerchantProductMerchant: Codable {
    let id, productID, upc, sku: String?
    let created, modified, multipleProductsPerPage: String?

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case upc, sku, created, modified
        case multipleProductsPerPage = "multiple_products_per_page"
    }

    init(id: String?, productID: String?, upc: String?, sku: String?, created: String?, modified: String?, multipleProductsPerPage: String?) {
        self.id = id
        self.productID = productID
        self.upc = upc
        self.sku = sku
        self.created = created
        self.modified = modified
        self.multipleProductsPerPage = multipleProductsPerPage
    }
}

typealias productViewer = [ProductViewer]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
