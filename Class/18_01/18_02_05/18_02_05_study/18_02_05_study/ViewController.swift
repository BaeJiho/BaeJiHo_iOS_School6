//
//  ViewController.swift
//  18_02_05_study
//
//  Created by 배지호 on 2018. 2. 5..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var bgImgView: UIImageView?
    var mainTitle: UILabel?
    var SubTitle: UILabel?
    var btn: UIButton?
    var strText: UITextField?
    var bgScreen: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        
    }
    
    func createView() {
        
        bgImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        bgImgView?.image = UIImage(named: "soso")
        bgImgView?.contentMode = .scaleAspectFit
        view.addSubview(bgImgView!)
        
        bgScreen = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        bgScreen?.backgroundColor = UIColor.black
        bgScreen?.alpha = 0.1
        view.addSubview(bgScreen!)
        
        mainTitle = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 4))
        mainTitle?.text = "UI 실습"
        mainTitle?.textAlignment = NSTextAlignment.center
        mainTitle?.font = UIFont.systemFont(ofSize: 40)
        mainTitle?.textColor = UIColor.white
        mainTitle?.tag = 1
        view.addSubview(mainTitle!)
        
        strText = UITextField(frame: CGRect(x: 0, y: view.frame.size.height / 4, width: view.frame.size.width, height: view.frame.size.height / 10))
        strText?.borderStyle = .line
        strText?.delegate = self
        view.addSubview(strText!)
        
        SubTitle = UILabel(frame: CGRect(x: 0, y: 300, width: view.frame.size.width, height: view.frame.size.height / 10))
        SubTitle?.layer.borderWidth = 1
        view.addSubview(SubTitle!)
        
        btn = UIButton(type: .custom)
        btn?.frame = CGRect(x: view.frame.size.width / 4, y: 380, width: view.frame.size.width / 4 * 2, height: view.frame.size.height / 15)
        btn?.layer.borderWidth = 1
        btn?.setTitle("버튼", for: .normal)
        btn?.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        view.addSubview(btn!)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            strText?.resignFirstResponder()
        }
        return true
    }
    
    @objc func btnAction(_ sender: UIButton) {
        SubTitle?.text = strText?.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

