//
//  ViewModel .swift
//  SmartFrostApp
//
//  Created by Lala on 18.03.2024.
//

import Foundation

class ProductListViewModel {
    private var products: [Product] = []

    func loadProducts() {
        // Здесь будет код для загрузки продуктов, пока что добавим тестовые данные
        products = [
            Product(id: UUID(), name: "Молоко", expiryDate: Date()),
            Product(id: UUID(), name: "Яблоки", expiryDate: Date())
        ]
    }

    func numberOfProducts() -> Int {
        return products.count
    }

    func productAtIndex(_ index: Int) -> Product {
        return products[index]
    }
}
