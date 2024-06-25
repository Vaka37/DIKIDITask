//
//  TabMain.swift
//  DIKIDI
//
//  Created by Vakil on 19.06.2024.
//

import SwiftUI

/// Таб бар приложения
struct TabBarMain: View {
    
    // MARK: - Constants
    private enum Constants {
        static let headerMainLabel = "Главная"
        static let headerCatalogLabel = "Каталог"
        static let headerSaleLabel = "Акции"
        static let headerNotesLabel = "Мои записи"
        static let headerOtherLabel = "Еще"
    }
    
    // MARK: - Body
    var body: some View {
        TabView {
            MainView()
                .environmentObject(mainViewModel)
                .tabItem {
                    Label(Constants.headerMainLabel, systemImage: "house")
                }
            CatalogView()
                .tabItem {
                    Label(Constants.headerCatalogLabel, systemImage: "rectangle.stack")
                }
            SaleView()
                .tabItem {
                    Label(Constants.headerSaleLabel, systemImage: "circle.dashed")
                }
            MyNotesView()
                .tabItem {
                    Label(Constants.headerNotesLabel, systemImage: "book")
                }
            OtherView()
                .tabItem {
                    Label(Constants.headerOtherLabel, systemImage: "line.3.horizontal")
                }
                .badge(1)
        }
        .onAppear() {
            mainViewModel.fetch()
        }
    }
    @ObservedObject private var mainViewModel = ViewModelMain()
}

#Preview {
    TabBarMain()
}
