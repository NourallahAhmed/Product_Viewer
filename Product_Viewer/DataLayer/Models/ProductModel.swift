//
//  ProductModel.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import Foundation

// MARK: - WelcomeElement
struct ProductViewer: Codable {
    let product: Product?
    let productMerchants: [ProductMerchantElement]?

    enum CodingKeys: String, CodingKey {
        case product
        case productMerchants
    }

    init(product: Product?, productMerchants: [ProductMerchantElement]?) {
        self.product = product
        self.productMerchants = productMerchants
    }
}

// MARK: - Product
struct Product: Codable {
    let id, name, description, price: String?
    let unitPrice, productTypeID: JSONNull?
    let imageURL: String?
    let shoppingListItemID, shoppingCartItemID: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, name, description, price
        case unitPrice
        case productTypeID
        case imageURL
        case shoppingListItemID
        case shoppingCartItemID
    }

    init(id: String?, name: String?, description: String?, price: String?, unitPrice: JSONNull?, productTypeID: JSONNull?, imageURL: String?, shoppingListItemID: JSONNull?, shoppingCartItemID: JSONNull?) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.unitPrice = unitPrice
        self.productTypeID = productTypeID
        self.imageURL = imageURL
        self.shoppingListItemID = shoppingListItemID
        self.shoppingCartItemID = shoppingCartItemID
    }
}

// MARK: - ProductMerchantElement
struct ProductMerchantElement: Codable {
    let merchant: Merchant?
    let merchantProduct: MerchantProduct?
    let productMerchant: ProductMerchantProductMerchant?

    enum CodingKeys: String, CodingKey {
        case merchant
        case merchantProduct
        case productMerchant
    }

    init(merchant: Merchant?, merchantProduct: MerchantProduct?, productMerchant: ProductMerchantProductMerchant?) {
        self.merchant = merchant
        self.merchantProduct = merchantProduct
        self.productMerchant = productMerchant
    }
}

// MARK: - Merchant
struct Merchant: Codable {
    let id, name: String?

    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }
}

// MARK: - MerchantProduct
struct MerchantProduct: Codable {
    let id, price, upc, sku: String?
    let buyURL: String?
    let discountPercent: String?
    let unitPrice: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, price, upc, sku
        case buyURL
        case discountPercent
        case unitPrice
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
        case productID
        case upc, sku, created, modified
        case multipleProductsPerPage
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
