//
//  AppDelegate.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectiOnptions: UIScene.ConnectionOptions) {
        guard let newWindowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: newWindowScene.coordinateSpace.bounds)
        window?.windowScene = newWindowScene
        window?.makeKeyAndVisible()
        
        window?.rootViewController = TabBarMenu()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let router = ViperList_Router.startExecution()
        let inirialViewController = router.entry!
        
        let navigation = UINavigationController()
        navigation.viewControllers = [inirialViewController]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigation
        
        
        return true
    }

}

