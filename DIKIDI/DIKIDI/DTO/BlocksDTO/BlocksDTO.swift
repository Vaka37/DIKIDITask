//
//  BlocksDTO.swift
//  DIKIDI
//
//  Created by Vakil on 22.06.2024.
//

import Foundation
/// Модель блоков которые приходят из сети
struct BlocksDTO: Codable {
    let shares: SharesDTO
    let categories: [CategoryDTO]
    let examples: String
    let catalog: [CatalogDTO]
    let examples2: String
    
    enum CodingKeys: String, CodingKey {
        case categories
        case shares, examples, catalog, examples2
    }
}


