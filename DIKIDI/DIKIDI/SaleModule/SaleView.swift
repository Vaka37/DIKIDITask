//
//  SaleView.swift
//  DIKIDI
//
//  Created by Vakil on 19.06.2024.
//

import SwiftUI

/// Вью с акциями
struct SaleView: View {
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
    SaleView()
}
