//
//  newViewController.swift
//  18_02_11_Study
//
//  Created by 배지호 on 2018. 2. 11..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class newViewController: UIViewController {

    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backAction(_ sender: UIButton) {
        let alertAC = UIAlertController(title: "확인", message: "뒤로 가시겠습니까?", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "네", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        alertAC.addAction(action1)
        alertAC.addAction(action2)
        self.present(alertAC, animated: true, completion: nil)
        
    }
    @IBAction func goAction(_ sender: UIButton) {
        let alertAC = UIAlertController(title: "확인", message: "가입하시겠습니까?", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "네", style: .default) { (action) in
            if var list = UserDefaults.standard.array(forKey: key) as? [[String : Any]] {
                let dic:[String : Any] = ["id" : self.idTF.text!, "pw" : self.pwTF.text!]
                list.append(dic)
                UserDefaults.standard.set(list, forKey: key)
                self.navigationController?.popViewController(animated: true)
            } else {
                var list:[[String : Any]] = []
                let dic:[String : Any] = ["id" : self.idTF.text!, "pw" : self.pwTF.text!]
                list.append(dic)
                UserDefaults.standard.set(list, forKey: key)
                self.navigationController?.popViewController(animated: true)
            }
        }
        let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        alertAC.addAction(action1)
        alertAC.addAction(action2)
        self.present(alertAC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   

}
