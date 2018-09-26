//
//  Favorites.swift
//  GoodBoy
//
//  Created by Dev on 9/26/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit

struct Favorites {
    let breed : String
    let timeStamp : String
    
    init(breed: String, timeStamp : String) {
        self.breed = breed
        self.timeStamp = timeStamp
    }
}
