//
//  TabBar.swift
//  ViperSfera
//
//  Created by macbook on 10.12.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    private func configureTabBar() {
    
        let router = SferaListRouter.startExecution()
        let firstVC = router.entry!
        
        let navigationController = UINavigationController(rootViewController: firstVC)
        
        let firstViewController = navigationController
        let secondViewController = SferaFavoriteViewController()
        
        let weightConfigImage = UIImage.SymbolConfiguration(weight: .black)
        
        let searchPhotosImage = UIImage(systemName: "book.circle", withConfiguration: weightConfigImage)!
        searchPhotosImage.withTintColor(.red)
        let favoritePhotosImage = UIImage(systemName: "book.circle.fill", withConfiguration: weightConfigImage)!
        favoritePhotosImage.withTintColor(.red)
        
        viewControllers = [
            generateNavigatonController(firstViewController, "Сartoons", searchPhotosImage),
            generateNavigatonController(secondViewController, "Favourite", favoritePhotosImage)
        ]
        
        setTabBar()
    }
    
    private func setTabBar() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor.systemRed
        
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
    }
    
    func generateNavigatonController(_ rootViewController: UIViewController, _ title: String, _ image: UIImage) -> UIViewController {
        let navigationController = (rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}

