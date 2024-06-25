//
//  NetworkService.swift
//  DIKIDI
//
//  Created by Vakil on 19.06.2024.
//

import Foundation

/// Протокол для запросов в сеть
protocol NetworkServiceProtocol: AnyObject {
    /// Запрос в сеть
    func getData(complitionHandler: @escaping (TestModel) -> Void)
}

/// Класс для управления запросов сети
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Constants
    
    private enum Constants {
        static let sheme = "https"
        static let host = "api-beauty.test.dikidi.ru"
        static let path = "/home/info?"
        static let apiKey = "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"
        static let httpMethod = "POST"
        static let headerFields = "Authorization"
        static let bodyKey = "city_id"
    }
    
    //MARK: - Private Properties
    private var urlComponents = URLComponents()
    
     // MARK: - Public Methods
    func getData(complitionHandler: @escaping (TestModel) -> Void) {
        createURL()
        guard let url = urlComponents.url else { return }
        var body: [String: Any] = [:]
        body = [
            Constants.bodyKey : 468902
        ]
        var request = URLRequest(url: url)
        request.setValue(Constants.apiKey, forHTTPHeaderField: Constants.headerFields)
        request.httpMethod = Constants.httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = body.percentEncoded()
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(ResponseDTO.self, from: data)
                    let testModel = TestModel(dto: result.data)
                    complitionHandler(testModel)
                } catch {
                    
                }
            }
        }.resume()
    }
    
    // MARK: - Private Methods
    
    private func createURL() {
        urlComponents.scheme = Constants.sheme
        urlComponents.host = Constants.host
        urlComponents.path = Constants.path
    }
}
