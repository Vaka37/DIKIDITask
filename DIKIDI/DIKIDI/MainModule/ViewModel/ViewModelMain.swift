//
//  MainViewModule.swift
//  DIKIDI
//
//  Created by Vakil on 19.06.2024.
//

import Foundation

protocol ViewModelMainProtocol: AnyObject {
    ///Запрос в сеть
    func fetch()
}

/// Вью модель для главного экрана
final class ViewModelMain: ViewModelMainProtocol, ObservableObject {
    
    @Published var testModel: TestModel?
    @Published var searchBarText = ""
    
    //MARK: - Private Properties
    private let networkService = NetworkService()
    func fetch() {
        networkService.getData { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                self.testModel = result
            }
        }
    }
}
