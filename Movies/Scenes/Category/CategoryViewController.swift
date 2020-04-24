//
//  CategoryViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 09/01/2020.
//  Copyright © 2020 Rodrigo Gerez. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var categoriesTableView: UITableView!
    var categoryViewModel: CategoryViewModelProtocol!
    var categories: [MovieGenre]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Set up all visual improvements
    func setupUI() {
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "categoryItem"
        
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: identifier) as! CategoryCell
        if let categories = categories, indexPath.row < categories.count {
            cell.categoryName.text = categories[indexPath.row].name
        }
            
        return cell
    }
    
    
}

extension CategoryViewController: UITableViewDelegate {
    
}
