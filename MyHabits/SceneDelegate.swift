//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 24.8.24..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = ( scene as? UIWindowScene ) else { return }
        window = UIWindow(windowScene: windowScene)
        
        UINavigationBar.appearance().tintColor = UIColor(named: "NavColor")
        UITabBar.appearance().tintColor = UIColor(named: "NavColor")
//        UINavigationController.appearance().tintColor = UIColor.purple
         
        let tabBarController = UITabBarController()
        let habitsNavigationController = UINavigationController()
        let infoNavigationController = UINavigationController()
        
        habitsNavigationController.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(systemName: "rectangle.grid.1x2.fill"), tag: 0)
        infoNavigationController.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), tag: 1)
        habitsNavigationController.viewControllers = [HabitsViewController()]
        infoNavigationController.viewControllers = [InfoViewController()]
        
        tabBarController.viewControllers = [habitsNavigationController, infoNavigationController]
        tabBarController.tabBar.backgroundColor = .systemBackground
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    
    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

