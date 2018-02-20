//
//  LoginViewController.swift
//  18_02_20_Study
//
//  Created by 배지호 on 2018. 2. 20..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    var idTF: UITextField!
    var pwTF: UITextField!
    
    var loginBtn: UIButton!
    var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        createUI()
        updateLayout()
    }
    
    private func createUI() {
        idTF = UITextField()
        idTF.placeholder = "아이디 입력"
        idTF.tag = 10
        idTF.delegate = self
        idTF.borderStyle = .line
        idTF.textAlignment = .left
        view.addSubview(idTF)
        
        pwTF = UITextField()
        pwTF.placeholder = "패스워드 입력"
        pwTF.tag = 11
        pwTF.delegate = self
        pwTF.borderStyle = .line
        pwTF.textAlignment = .left
        pwTF.keyboardType = .phonePad
        pwTF.isSecureTextEntry = true
        view.addSubview(pwTF)
        
        loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("로그인", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.setTitleColor(.blue, for: .highlighted)
        loginBtn.addTarget(self, action: #selector(loginAction(_:)), for: .touchUpInside)
        view.addSubview(loginBtn)
        
        signUpBtn = UIButton(type: .custom)
        signUpBtn.setTitle("회원가입", for: .normal)
        signUpBtn.setTitleColor(.black, for: .normal)
        signUpBtn.setTitleColor(.blue, for: .highlighted)
        signUpBtn.addTarget(self, action: #selector(signUpAction(_:)), for: .touchUpInside)
        view.addSubview(signUpBtn)
    }
    
    private func updateLayout() {
        var offSetY: CGFloat = 150
        var inputFrameWidth: CGFloat = view.frame.size.width / 2
        var offSetX: CGFloat = view.frame.size.width/2 - inputFrameWidth / 2
        idTF.frame = CGRect(x: offSetX, y: offSetY, width: inputFrameWidth, height: 50)
        offSetY += idTF.frame.size.height + 10
        pwTF.frame = CGRect(x: offSetX, y: offSetY, width: inputFrameWidth, height: 50)
        offSetY += pwTF.frame.size.height + 30
        
        let btnMargin: CGFloat = 10
        loginBtn.frame = CGRect(x: offSetX, y: offSetY, width: (inputFrameWidth - btnMargin) / 2, height: 50)
        offSetX += loginBtn.frame.size.width + btnMargin
        signUpBtn.frame = CGRect(x: offSetX, y: offSetY, width: (inputFrameWidth - btnMargin) / 2, height: 50)
    }
    
    @objc func loginAction(_ sender: UIButton) {
        if checkInputValid() {
            
        }
    }
    
    @objc func signUpAction(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "확인", message: "회원가입을 하시겠습니까?", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "네", style: .default) { (action) in
            let newVC = SignUpViewController()
            self.navigationController?.pushViewController(newVC, animated: true)
        }
        let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        alertVC.addAction(action2)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    private func checkInputValid() -> Bool {
        if pwTF.text!.count > 4 {
            return true
        } else {
            let alertVC: UIAlertController = UIAlertController(title: "확인", message: "비밀번호가 너무 짧습니다.", preferredStyle: .actionSheet)
            let action: UIAlertAction = UIAlertAction(title: "네", style: .default, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 10 {
            pwTF.becomeFirstResponder()
        } else {
            pwTF.resignFirstResponder()
        }
        return true
    }
}
