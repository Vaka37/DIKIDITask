//
//  ListDTO.swift
//  DIKIDI
//
//  Created by Vakil on 22.06.2024.
//

import Foundation

/// Блок  "Акция"
struct ListDTO: Codable {
    let id, name: String
    let discountValue, view: String
    let usedCount: String
    let icon: String
    let companyName, companyStreet, companyHouse: String
    let companyImage: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case discountValue = "discount_value"
        case view
        case usedCount = "used_count"
        case icon
        case companyName = "company_name"
        case companyStreet = "company_street"
        case companyHouse = "company_house"
        case companyImage = "company_image"
    }
}
