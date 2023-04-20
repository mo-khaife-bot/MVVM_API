//
//  Products.swift
//  MVVM_API
//
//  Created by mohomed Ali on 19/04/2023.
//

import Foundation

// MARK: - Welcome
struct ProductsList: Decodable {
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
