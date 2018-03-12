//
//  SignUpViewController.swift
//  18_02_20_Study
//
//  Created by 배지호 on 2018. 2. 20..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

let key = "UserList"
class SignUpViewController: UIViewController {
    
    var backView: UIView!
    var idTF: UITextField!
    var pwTF: UITextField!
    
    var signInBtn: UIButton!
    var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        layoutView()
        
    }
    
    
    func createView() {
        backView = UIView(frame: view.bounds)
        backView.backgroundColor = UIColor.gray
        self.view.addSubview(backView)
        
        idTF = UITextField()
        idTF.placeholder = "가입할 아이디 입력"
        idTF.textAlignment = .left
        idTF.borderStyle = .line
        idTF.tag = 1
        self.view.addSubview(idTF)
        
        pwTF = UITextField()
        pwTF.placeholder = "가입할 패스워드 입력"
        pwTF.textAlignment = .left
        pwTF.borderStyle = .line
        self.view.addSubview(pwTF)
        
        backBtn = UIButton(type: .custom)
        backBtn.setTitle("취소", for: .normal)
        backBtn.setTitleColor(.white, for: .highlighted)
        backBtn.addTarget(self, action: #selector(backAction(_:)), for: .touchUpInside)
        self.view.addSubview(backBtn)
        
        signInBtn = UIButton(type: .custom)
        signInBtn.setTitle("완료", for: .normal)
        signInBtn.setTitleColor(.white, for: .highlighted)
        
        signInBtn.addTarget(self, action: #selector(signAction(_:)), for: .touchUpInside)
        self.view.addSubview(signInBtn)
        
    }
    func layoutView() {
        var offSetY: CGFloat = 150
        var inputFrameWidth: CGFloat = view.frame.size.width / 2
        var offSetX: CGFloat = view.frame.size.width/2 - inputFrameWidth / 2
        idTF.frame = CGRect(x: offSetX, y: offSetY, width: inputFrameWidth, height: 50)
        offSetY += idTF.frame.size.height + 10
        pwTF.frame = CGRect(x: offSetX, y: offSetY, width: inputFrameWidth, height: 50)
        offSetY += pwTF.frame.size.height + 30
        
        let btnMargin: CGFloat = 10
        signInBtn.frame = CGRect(x: offSetX, y: offSetY, width: (inputFrameWidth - btnMargin) / 2, height: 50)
        offSetX += signInBtn.frame.size.width + btnMargin
        backBtn.frame = CGRect(x: offSetX, y: offSetY, width: (inputFrameWidth - btnMargin) / 2, height: 50)
    }
    
    @objc func signAction(_ sender: UIButton) {
        if self.idTF.text!.count > 4 {
            if var list = UserDefaults.standard.array(forKey: key) as? [[String:String]] {
                var dic: [String:String] = ["id":idTF.text!, "pw":pwTF.text!]
                list.append(dic)
                UserDefaults.standard.set(list, forKey: key)
                let alertAC = UIAlertController(title: "확인", message: "가입을 완료하였습니다.", preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "네", style: .default, handler: { (action) in
                    self.dismiss(animated: true, completion: nil)
                })
                alertAC.addAction(action)
                self.present(alertAC, animated: true, completion: nil)
            } else {
                var list:[[String:String]] = []
                var dic: [String:String] = ["id":idTF.text!,"pw":pwTF.text!]
                list.append(dic)
                UserDefaults.standard.set(list, forKey: key)
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            let alertVC = UIAlertController(title: "확인", message: "아이디 길이가 작습니다.", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "네", style: .cancel, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
        }
        
    }
    
    @objc func backAction(_ sender: UIButton) {
        let alertVC: UIAlertController = UIAlertController(title: "확인", message: "돌아가시겠씁니까?", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "네", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        alertVC.addAction(action)
        alertVC.addAction(action2)
        self.present(alertVC, animated: true, completion: nil)
    }
}
