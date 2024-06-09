//
//  ProductListViewController.swift
//  SmartFrostApp
//
//  Created by Lala on 18.03.2024.
//

import UIKit

class ProductListViewController: UITableViewController {
    var viewModel = ProductListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadProducts()
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfProducts()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let product = viewModel.productAtIndex(indexPath.row)
        cell.textLabel?.text = product.name
        // Дополнительно можно настроить отображение даты истечения срока годности
        return cell
    }
}
