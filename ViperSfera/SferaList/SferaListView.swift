//
//  ViperList_View.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation
import UIKit

// Talks to presenter

protocol SferaListViewProtocol {
    var presenter: SferaListPresenterProtocol? { get set }
    
    func update(with sfera:[Sfera])
    func update(with error:String)
}

class SferaListViewController: UIViewController, SferaListViewProtocol {

    // MARK: - COMPONENT
    private let tableView = UITableView()
    private let messageLabel = UILabel()
    private let searchController = UISearchController(searchResultsController: nil)
    private var filteredSfera: [Sfera] = []
    private var searchBarIsEmpty: Bool {
        if let title = searchController.searchBar.text { return title.isEmpty } else { return false }
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    // MARK: - PROPERTY
    var resultsTableViewController: SferaListPresenterProtocol!
    var presenter: SferaListPresenterProtocol?
    var sferas: [Sfera] = []
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setUpSearchController()
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let seledtIndex = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: seledtIndex, animated: true)
        }
    }
    
}

extension SferaListViewController {
    
    private func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.isHidden = false
        messageLabel.text = "Loading..."
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.textAlignment = .center
    }
    
    private func layout() {
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        // tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

// MARK: - ViperList_View_Protocol
extension SferaListViewController {
    func update(with sfera: [Sfera]) {
        DispatchQueue.main.async { [weak self] in
            self?.sferas = sfera
            
            self?.messageLabel.isHidden = true
            
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
    }
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.sferas = []
            self?.tableView.isHidden = true
            
            self?.messageLabel.isHidden = false
            self?.messageLabel.text = error
        }
    }
    
}
// MARK: - UITableViewDelegate
extension SferaListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            presenter?.tapOnDetail((filteredSfera[indexPath.row]))
        } else {
            presenter?.tapOnDetail((sferas[indexPath.row]))
        }
    }
}

// MARK: - UITableViewDataSource
extension SferaListViewController: UITableViewDataSource {
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredSfera.count
        } else {
            return sferas.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let sfera: Sfera
        if isFiltering {
            sfera = filteredSfera[indexPath.row]
        } else {
            sfera = sferas[indexPath.row]
        }
        cell.textLabel?.text = sfera.title
        return cell
    }
    
    func filterContentForSearchText(_ searchText: String) {
      filteredSfera = sferas.filter { (sfera: Sfera) -> Bool in
        return sfera.title.lowercased().contains(searchText.lowercased())
      }
      
      tableView.reloadData()
    }

}

// MARK: Search
extension SferaListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    private func setUpSearchController() {
        navigationItem.searchController = searchController
        navigationItem.title = "SearchController"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
    }
}


