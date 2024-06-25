//
//  Model.swift
//  DIKIDI
//
//  Created by Vakil on 25.06.2024.
//

import Foundation

/// Модель для презентейшн слоя
struct TestModel {
    /// Количество категорий
    let categoryCount: String
    /// Категории
    let category: [CategoryDTO]
    /// количество в блоке премиум
    let premiumCount: String
    /// Премиум блок
    let primiumData: [CatalogDTO]
    /// Количество в блоке акции
    let saleCount: String
    /// Блок акции
    let sale: [ListDTO]
    /// Картинка с примером работ
    let exampleImage: String
    
    init(dto: DataDto) {
        self.categoryCount = String(dto.blocks.categories.count)
        self.category = dto.blocks.categories
        self.premiumCount = String(dto.blocks.catalog.filter({ item in
            item.vipTariff == true
        }).count)
        self.primiumData = dto.blocks.catalog.filter({ item in
            item.vipTariff == true
        })
        self.saleCount = String(dto.blocks.shares.list.count)
        self.sale = dto.blocks.shares.list
        self.exampleImage = dto.blocks.examples2
    }
}
