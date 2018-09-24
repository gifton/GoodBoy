//
//  ViewController.swift
//  GoodBoy
//
//  Created by Dev on 9/23/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let homeController = HomeController()
        homeController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let profileController = ProfileController()
        profileController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostViewed, tag: 1)
        
        
        let tabBarList = [homeController, profileController]
        viewControllers = tabBarListt.map { UINavigationController(rootViewController: $0) }
        
        self.tabBar.layer.opacity = 0.7
        self.tabBar.barStyle = UIBarStyle.default
    }
}

