//
//  ProfileController.swift
//  GoodBoy
//
//  Created by Dev on 9/24/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit

class ProfileController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Profile"
        self.view = ProfileView(frame: UIScreen.main.bounds)
    }
}

