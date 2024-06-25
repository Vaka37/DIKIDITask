//
//  CatalogDTO.swift
//  DIKIDI
//
//  Created by Vakil on 22.06.2024.
//

import Foundation

/// Блок с каталогом
struct CatalogDTO: Codable {
    let id, name: String
    let image: ImageDTO
    let street, house: String
    let vipTariff: Bool
    let categories: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, house, street, categories
        case vipTariff = "vip_tariff"
    }
}
