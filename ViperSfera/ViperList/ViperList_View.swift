//
//  ViperList_View.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation
import UIKit

// Talks to presenter

protocol ViperList_View_Protocol {
    var presenter: ViperList_Presenter_Protocol? {get set}
    
    func update(with viper:[Viper])
    func update(with error:String)
}

class ViperListViewController: UIViewController, ViperList_View_Protocol {

    // MARK: - COMPONENT
    private let tableView: UITableView = UITableView()
    private let messageLabel: UILabel = UILabel()
    var searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - PROPERTY
    var presenter: ViperList_Presenter_Protocol?
    var viper: [Viper] = []
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let seledtIndex = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: seledtIndex, animated: true)
        }
        navigationItem.searchController = searchController
        view.backgroundColor = .systemBackground
        navigationItem.title = "Search"
    }
}

extension ViperListViewController {
    func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.isHidden = false
        messageLabel.text = "Loading..."
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.textColor = .black
        messageLabel.textAlignment = .center
    }
    
    func layout() {
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
extension ViperListViewController {
    func update(with viper: [Viper]) {
        DispatchQueue.main.async { [weak self] in
            self?.viper = viper
            self?.messageLabel.isHidden = true
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
    }
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.viper = []
            self?.tableView.isHidden = true
            
            self?.messageLabel.isHidden = false
            self?.messageLabel.text = error
        }
    }
}
// MARK: - UITableViewDelegate
extension ViperListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tapOnDetail(viper[indexPath.row])
        
    }
}

// MARK: - UITableViewDataSource
extension ViperListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viper.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = viper[indexPath.row].title
            content.secondaryText = "\(viper[indexPath.row].year)"
            cell.contentConfiguration = content
        } else {
            // Fallback on earlier versions
        }
        return cell
    }
    
    
}
