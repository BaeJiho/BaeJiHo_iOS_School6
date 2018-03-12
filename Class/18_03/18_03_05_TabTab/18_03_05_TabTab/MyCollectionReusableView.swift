//
//  MyCollectionReusableView.swift
//  18_03_05_TabTab
//
//  Created by 배지호 on 2018. 3. 5..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MyCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var collectionView: UICollectionView!
}

extension MyCollectionReusableView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SubCollectionViewCell
        cell.dayLB.text = "일요일"
        return cell
        
    }
}
