//
//  FirstViewController.swift
//  18_03_05_TabTab
//
//  Created by 배지호 on 2018. 3. 5..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit
enum day {
    
}
class FirstViewController: UIViewController {

    @IBOutlet weak var mainCollection: UICollectionView!
    @IBOutlet weak var bg: UIImageView!
    var day:[String] = ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"]
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let layout = mainCollection.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//        }
    }
}


extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
//    accessories
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        } else {
            
            return 35
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard var cell = view as? MyCollectionViewCell else { return }
        if cell.isSelected {
            cell.backgroundColor = .red
        } else {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell

        if indexPath.section == 0 {
            cell.name.text = "\(day[indexPath.row])"
        } else {
            
            cell.name.text = "\(indexPath.item)"
            cell.name.textAlignment = .center
        }
        cell.name.textColor = .white
        
        print("\(indexPath.item)")
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("\(indexPath.item)")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    }
}
