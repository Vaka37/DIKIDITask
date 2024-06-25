//
//  CateforyViewCell.swift
//  DIKIDI
//
//  Created by Vakil on 25.06.2024.
//

import SwiftUI

/// Ячейка с категориями
struct CategoryView: View {
    let category: [ListDTO]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(category, id: \.name){ item in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.white)
                        LazyVStack(alignment: .leading) {
                            AsyncImage(url: URL(string: item.companyImage)){ poster in
                                poster
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 200)
                                    .cornerRadius(9)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 170, height: 200)
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 10).fill(.black.opacity(0.4))
                            }
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .fontWeight(.medium)
                                HStack {
                                    AsyncImage(url: URL(string: item.icon)){ poster in
                                        poster
                                            .resizable()
                                            .frame(width: 45, height: 45)
                                            .cornerRadius(9)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 45, height: 45)
                                    }
                                    VStack(alignment: .leading) {
                                        Text(item.companyName)
                                            .lineLimit(1)
                                            .fontWeight(.medium)
                                        Text("\(item.companyStreet),\(item.companyHouse) ")
                                            .foregroundStyle(.gray)
                                            .lineLimit(1)
                                    }
                                }
                            }
                            .padding(.leading)
                            .padding(.bottom)
                        }
                    }
                }
            }
        }
    }
}

