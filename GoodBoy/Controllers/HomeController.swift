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


extension HomeView {
    @objc func shuffleButtonPressed(sender : UIButton) {
        print ("shuffle button tapped!")
        guard let url = URL(string: DogAPI.random.rawValue) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                print(jsonArray, "ARRAY DOE")
                print ("hum hum!")
            } catch let parsingError {
                print("Error", parsingError)
            }
            
        }
        task.resume()
        print("it finished???")
    }
}
