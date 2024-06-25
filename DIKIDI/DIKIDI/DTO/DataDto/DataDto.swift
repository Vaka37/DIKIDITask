//
//  DataDto.swift
//  DIKIDI
//
//  Created by Vakil on 21.06.2024.
//

import Foundation
/// Модель данных которые приходят из сети
struct DataDto: Codable {
    /// Название
    let title: String
    /// Картинка
    let image: String
    /// Количество категорий
    let catalogCount: String
    /// Блоки 
    let blocks: BlocksDTO
    
    enum CodingKeys: String, CodingKey {
        case title, image
        case catalogCount = "catalog_count"
        case blocks
    }
}
