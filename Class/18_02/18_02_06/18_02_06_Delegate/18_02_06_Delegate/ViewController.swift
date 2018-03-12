//
//  ViewController.swift
//  18_02_06_Delegate
//
//  Created by 배지호 on 2018. 2. 6..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyCustomViewDelegate, UIScrollViewDelegate{
    
    var display: UITextField!
    var strPrint: UILabel!
    var myCustomView:MyCustomView!
    var myCustomView2:MyCustomView!
    var sc: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        listCopy(list: 4)

        sc = UIScrollView()
        sc.frame = view.bounds
        sc.contentSize = CGSize(width: view.frame.size.width * 2, height: view.frame.size.height)
        sc.delegate = self
        view.addSubview(sc)
        
        myCustomView = MyCustomView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        myCustomView.delegate = self
        sc.addSubview(myCustomView)
        
        myCustomView2 = MyCustomView(frame: CGRect(x: sc.frame.size.width + 100, y: 100, width: 100, height: 100))
        myCustomView2.delegate = self
        sc.addSubview(myCustomView2)
        
        
        display = UITextField(frame: CGRect(x: 0, y: 50, width: view.frame.size.width, height: view.frame.size.height / 20))
        display.layer.borderWidth = 1
        self.view.addSubview(display)
        
        strPrint = UILabel(frame: CGRect(x: 0, y: 200, width: view.frame.size.width, height: view.frame.size.height / 20))
        strPrint.layer.borderWidth = 1
        self.view.addSubview(strPrint)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x, scrollView.contentOffset.y)
    }
    
    func didSelectedMyCustomView(_ customView: MyCustomView) {
        print("아이탬을 선택하였습니다.")
        myCustomView.backgroundColor = UIColor.blue
        strPrint.text = display.text
    }
//
//    func listCopy(list: Int) {
//        for index in 0..<list {
//            let x:CGFloat = CGFloat(index * 10)
//            let list = MyCustomView()
//            list.frame =  CGRect(x: 100 + x, y: 100, width: 100, height: 100)
//            self.view.addSubview(list)
//
//        }
//    }

}

