//
//  CategoryViewCell.swift
//  DIKIDI
//
//  Created by Vakil on 23.06.2024.
//

import SwiftUI

/// Ячейка с категориями
struct CategoryCell: View {
    let imageURL: String
    let title: String
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageURL)){ poster in
                poster
                    .resizable()
                    .frame(width: 160, height: 100)
                    .cornerRadius(9)
            } placeholder: {
                ProgressView()
                    .frame(width: 160, height: 100)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10).fill(.black.opacity(0.4))
            }
            Text(title)
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
    }
}
