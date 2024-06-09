//
//  fetchLatestReceipt.swift
//  SmartFrostApp
//
//  Created by Lala on 01.04.2024.
//

import Foundation
func fetchLatestReceipt() {
    let url = URL(string: "https://api.ofd.ru/v1/latest_receipt")! // Замените на актуальный URL
    var request = URLRequest(url: url)
    request.addValue("Bearer ваш_ключ_API", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print("Ошибка при выполнении запроса: \(error?.localizedDescription ?? "Неизвестная ошибка")")
            return
        }
        
        // Парсинг ответа и обработка данных
        do {
            let receipt = try JSONDecoder().decode(Receipt.self, from: data)
            // Обработайте полученные данные
        } catch {
            print("Ошибка при обработке данных: \(error.localizedDescription)")
        }
    }

    task.resume()
}
4
