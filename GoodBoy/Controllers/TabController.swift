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
        view.backgroundColor = .mainBlue
        let homeController = HomeController()
        homeController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let profileController = ProfileController()
        profileController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostViewed, tag: 1)
        
        
        let tabBarList = [homeController, profileController]
        viewControllers = tabBarList
        
        self.tabBar.backgroundColor = .gbPurple
        self.tabBar.barStyle = UIBarStyle.black
    }
}

