//
//  FavoritesCollectionViewController.swift
//  GoodBoy
//
//  Created by Dev on 9/25/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewID, for: indexPath) as! FavoritesCell
        
        return cell
    }
    
    
}
