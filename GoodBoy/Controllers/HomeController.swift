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
                
                guard let goodBoys = try? JSONDecoder().decode(GoodBoyResponse.self, from: dataResponse) else {
                    print ("unable to decode json")
                    return
                }
                
                for doggo in goodBoys.message {
                    let breed = doggo.components(separatedBy: "/")[4]
                    guard let url = try? URL(string: doggo)! else {
                        print("unable to create URL")
                        return
                    }
                    let returnObj: SingleGoodBoy = SingleGoodBoy.init(url: url, breed: breed)
                    self.goodBoyData.append(returnObj)
                    DispatchQueue.main.async {
                        self.homeTable.reloadData()
                    }
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        
    }
    func gatherDataTest() {
        guard let url = URL(string: DogAPI.random.rawValue) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            do {
                guard let goodBoys = try? JSONDecoder().decode(GoodBoyResponse.self, from: dataResponse) else {
                    print ("unable to decode json")
                    return
                }
                for doggo in goodBoys.message {
                    let breed = doggo.components(separatedBy: "/")[4]
                    guard let url = try URL(string: doggo) else {
                        print("unable to create URL")
                        return
                    }
                    let returnObj: SingleGoodBoy = SingleGoodBoy.init(url: url, breed: breed)
                    self.goodBoyData.append(returnObj)
                    self.reloadInputViews()
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        DispatchQueue.main.async {
            self.homeTable.reloadData()
            self.buildView()
        }
    }
}
