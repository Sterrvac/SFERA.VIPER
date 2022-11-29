//
//  SearchBarView.swift
//  ViperSfera
//
//  Created by macbook on 29.11.2022.
//

import UIKit

class SearchBarVС: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        view.backgroundColor = .systemBackground
        navigationItem.title = "Search"
    }
    
}
