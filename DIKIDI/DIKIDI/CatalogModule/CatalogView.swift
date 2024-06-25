//
//  CatalogView.swift
//  DIKIDI
//
//  Created by Vakil on 19.06.2024.
//

import SwiftUI

/// Вью с каталогом
struct CatalogView: View {
    
    // MARK: - Constants
    private enum Constants {
        static let functionInJobLabel = "Функционал в разработке"
    }
    
    // MARK: - Body
    var body: some View {
        Text(Constants.functionInJobLabel)
    }
}

#Preview {
    CatalogView()
}
