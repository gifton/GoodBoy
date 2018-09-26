//
//  DogAPI.swift
//  GoodBoy
//
//  Created by Dev on 9/26/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit

enum DogAPI : String {
    
    case random = "https://dog.ceo/api/breeds/image/random/10"
    case list_all = "https://dog.ceo/api/breeds/list/all"
    case by_breed = "https://dog.ceo/api/breed/"
    
    func breed_URL(breed: String) -> String {
        return (DogAPI.by_breed.rawValue + breed + "/images")
    }
}
