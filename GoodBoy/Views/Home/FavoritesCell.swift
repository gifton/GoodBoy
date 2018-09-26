//
//  FavoritesCell.swift
//  GoodBoy
//
//  Created by Dev on 9/25/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit

class FavoritesCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(favorite)
        favorite.frame = self.frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let favorite : UILabel = {
        let lbl = UILabel()
        lbl.text = "Corgi"
        lbl.font = .boldSystemFont(ofSize: FontSize.medium.rawValue)
        lbl.backgroundColor = UIColor.gbPurple
        lbl.layer.cornerRadius = 5
        lbl.layer.borderColor = UIColor.gbPurple.cgColor
        lbl.layer.borderWidth = 2
        lbl.textAlignment = .center
        lbl.textColor = .gbWhite
        lbl.layer.masksToBounds = true
        
        return lbl
    }()
}

