//
//  ViewController.swift
//  18_02_11_Study
//
//  Created by 배지호 on 2018. 2. 11..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

let key = "UserNameList"

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.placeholder = "아이디"
        pwTF.placeholder = "비밀번호"
        
    }
    
    @IBAction func newBtnAction(_ sender: UIButton) {
        let alertAC = UIAlertController(title: "회원가입", message: "회원가입을 하시겠습니까?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "네", style: .default) { (action) in
            let newVC = self.navigationController?.storyboard?.instantiateViewController(withIdentifier: "newViewController")
        }
        alertAC.addAction(action1)
        self.present(alertAC, animated: true, completion: nil)
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

