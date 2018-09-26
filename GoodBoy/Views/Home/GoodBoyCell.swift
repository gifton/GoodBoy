//
//  GoodBoyCell.swift
//  GoodBoy
//
//  Created by Dev on 9/25/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit

class GoodBoyCell: UITableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildCell()
        backgroundColor = .gbDarkPurple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let goodBoy : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let title : UILabel = {
        let lbl = UILabel()
        lbl.text = "N/A"
        lbl.font = .boldSystemFont(ofSize: FontSize.large.rawValue)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .offWhite
        return lbl
    }()
    
    func buildCell() {
        addSubview(title)
        addSubview(goodBoy)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            goodBoy.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            goodBoy.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
            goodBoy.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            goodBoy.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        ])
    }
}
