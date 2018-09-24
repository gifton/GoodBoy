//
//  MainController.swift
//  GoodBoy
//
//  Created by Dev on 9/24/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit

class HomeView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
        self.backgroundColor = .gbWhite
    }
    
    let tableViewID = "2434hkbkhb335bAAodb"
    let collectionViewID = "24ghfk02hdkbkAAodb"
    
    let upper : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.88, green:0.88, blue:0.91, alpha:1.0)
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    let shuffleButton : UIButton = {
        let btn = UIButton()
        btn.setHeightWidth(width: 25, height: 25)
        btn.backgroundColor = .gbPurple
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let homeTable : UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = true
        
        tb.allowsSelection = false
        tb.backgroundColor = .white
        
        return tb
    }()
    let favoritesView : UIView = {
        let view = UIView()
        view.backgroundColor = .gbPurple
        
        return view
    }()
    let searchBar = UISearchBar()
    
    func buildView() {
        addSubview(upper)
        upper.setAnchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
        upper.addSubview(shuffleButton)
        upper.addSubview(searchBar)
        shuffleButton.trailingAnchor.constraint(equalTo: upper.trailingAnchor, constant: -10).isActive = true
        shuffleButton.bottomAnchor.constraint(equalTo: upper.bottomAnchor, constant: -10).isActive = true
        searchBar.frame = CGRect(x: 5, y: 62.5, width: ScreenSize.SCREEN_WIDTH - 55, height: 30)
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        
        addSubview(favoritesView)
        favoritesView.frame = CGRect(x: 0, y: 110, width: ScreenSize.SCREEN_WIDTH, height: 40)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
