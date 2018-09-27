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

struct SingleGoodBoy {
    let url : URL
    let breed : String
    public init(url : URL, breed: String) {
        self.url = url
        self.breed = breed
    }
    func downloadedImage() -> UIImage {
        let image : UIImageView = {
            let iv = UIImageView()
            iv.downloaded(from: self.url)
            
            return iv
        }()
        if image.image != nil {
            return image.image!
        } else {
            print("unable to download image of good boy:(")
            let backgupImage : UIImage = #imageLiteral(resourceName: "failure_to_find_image")
            return backgupImage
        }
        
    }
}

struct GoodBoyResponse: Decodable {
    let message : [String]
}

enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}
