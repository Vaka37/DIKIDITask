//
//  CategoryDTO.swift
//  DIKIDI
//
//  Created by Vakil on 24.06.2024.
//

import Foundation
/// Блок с категориями
struct CategoryDTO: Codable {
    let id, name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image
    }
}
