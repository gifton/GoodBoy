//
//  HomeController.swift
//  GoodBoy
//
//  Created by Dev on 9/24/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit

class HomeController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        self.view = HomeView(frame: UIScreen.main.bounds)
    }
}
