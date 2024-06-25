//
//  PremiumViewCell.swift
//  DIKIDI
//
//  Created by Vakil on 25.06.2024.
//

import SwiftUI

/// Ячейка для преим блока
struct PremiumViewCell: View {
    let icon: String
    let name: String
    let category: String
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: icon)){ poster in
                poster
                    .resizable()
                    .frame(width: 45, height: 45)
                    .cornerRadius(9)
            } placeholder: {
                ProgressView()
                    .frame(width: 45, height: 45)
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 16))
                    .lineLimit(2)
                Text(category)
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button {
                
            } label: {
                Text("Записаться")
                    .padding()
            }
            .frame(height: 30)
            .foregroundStyle(.blue)
            .background(
                RoundedRectangle(cornerRadius: 5).stroke(Color.blue)
            )
        }
    }
}
