//
//  HomeTableViewController.swift
//  GoodBoy
//
//  Created by Dev on 9/24/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit

extension HomeView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(testData.count)
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.getNewImageHeight(imageSize: testData[indexPath.row].img.size, newWidth: ScreenSize.SCREEN_WIDTH - 4)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewID, for: indexPath) as! GoodBoyCell
        var image = testData[indexPath.row].img
        image = resizeImage(image: image, newWidth: ScreenSize.SCREEN_WIDTH - 4)
        cell.title.text = testData[indexPath.row].breed
        let ratio = image.size.width / image.size.height
        if cell.frame.width < image.size.width {
            let newHeight = cell.frame.width / ratio
            cell.goodBoy.frame.size = CGSize(width: cell.frame.width, height: newHeight)
        } else {
            let newWidth = cell.frame.height * ratio
            cell.goodBoy.frame.size = CGSize(width: newWidth, height: cell.frame.height)
        }
        cell.goodBoy.image = image
        return cell
    }
    
    
}
