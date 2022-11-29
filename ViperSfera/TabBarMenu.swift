//
//  TabBarMenu.swift
//  ViperSfera
//
//  Created by macbook on 29.11.2022.
//

import UIKit

class TabBarMenu: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tabBar.tintColor = .purple
    }
    
    fileprivate func setupView() {
        viewControllers = [generateViewController(view: SearchBarVС(), title: "Search", image: .search)]
    }
    
    fileprivate func generateViewController(view viewController: UIViewController, title: String, image: UITabBarItem.SystemItem) -> UINavigationController {
        
        let viewController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: image, tag: 0)
        viewController.navigationBar.prefersLargeTitles = true
        return viewController
    }
}

