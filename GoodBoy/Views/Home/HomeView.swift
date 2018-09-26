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
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        //or
        //self.view.endEditing(true)
        return true
    }
    var goodBoyData : [GoodBoy] = []
    let testData : [GoodBoy] = [GoodBoy.init(img: #imageLiteral(resourceName: "img6"), breed: "TestBreed1"),
                                GoodBoy.init(img: #imageLiteral(resourceName: "img7"), breed: "TestBreed2"),
                                GoodBoy.init(img: #imageLiteral(resourceName: "img4"), breed: "TestBreed3"),
                                GoodBoy.init(img: #imageLiteral(resourceName: "img2"), breed: "testBreed4"),
                                GoodBoy.init(img: #imageLiteral(resourceName: "img6"), breed: "TestBreed5"),
                                GoodBoy.init(img: #imageLiteral(resourceName: "img7"), breed: "TestBreed6"),
                                GoodBoy.init(img: #imageLiteral(resourceName: "img4"), breed: "TestBreed7")]
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
        self.backgroundColor = .gbDarkPurple
    }
    
    let tableViewID = "2434hkbkhb335bAAodb"
    let collectionViewID = "24ghfk02hdkbkAAodb"
    
    let upper : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gbPurple
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    let shuffleButton : UIButton = {
        let btn = UIButton()
        btn.setHeightWidth(width: 25, height: 25)
        btn.setImage(#imageLiteral(resourceName: "shuffle"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(shuffleButtonPressed(sender:)), for: .touchUpInside)
        return btn
    }()
    let homeTable : UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = true
        tb.allowsSelection = false
        tb.backgroundColor = .gbDarkPurple
        
        return tb
    }()
    let favoritesCollectionView : UICollectionView = {
         let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.allowsSelection = true
        cv.showsHorizontalScrollIndicator = false
        
        return cv
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
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        
        initScrollViews()
    }
    
    func initScrollViews() {
        homeTable.register(GoodBoyCell.self, forCellReuseIdentifier: tableViewID)
        homeTable.delegate = self
        homeTable.dataSource = self
        
        favoritesCollectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: collectionViewID)
        favoritesCollectionView.delegate = self
        favoritesCollectionView.dataSource = self
        
        addSubview(favoritesCollectionView)
        
        favoritesCollectionView.frame = CGRect(x: 0, y: 100, width: ScreenSize.SCREEN_WIDTH, height: 40)
        
        addSubview(homeTable)
        
        homeTable.setAnchor(top: favoritesCollectionView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 5, paddingLeading: 2, paddingBottom: 0, paddingTrailing: 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
