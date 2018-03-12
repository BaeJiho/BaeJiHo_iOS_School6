//
//  ViewController.swift
//  18_02_10_Study
//
//  Created by 배지호 on 2018. 2. 10..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

let key = "UserNameList"
class ViewController: UIViewController {

    @IBOutlet weak var mainTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTF.placeholder = "이름 임력"
        ageTF.placeholder = "나이 입력"
        pwTF.placeholder = "비밀번호 임력"
    }
    @IBAction func addAction(_ sender: UIButton) {
        if var list = UserDefaults.standard.array(forKey: key) as? [[String:Any]] {
            
            let dic:[String:Any] = ["name":mainTF.text!,"age":ageTF.text!, "pw":pwTF.text!]
            
            list.append(dic)
            UserDefaults.standard.set(list, forKey: key)
        }else {
            var list:[[String:Any]] = []
            let dic: [String:Any] = ["name":mainTF.text!,"age":ageTF.text!, "pw":pwTF.text!]
            
            list.append(dic)
            UserDefaults.standard.set(list, forKey: key)
        }
    }
    
    @IBAction func listAction(_ sender: UIButton) {
        if let list = UserDefaults.standard.array(forKey: key) as? [[String:Any]] {
            print(list)
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

