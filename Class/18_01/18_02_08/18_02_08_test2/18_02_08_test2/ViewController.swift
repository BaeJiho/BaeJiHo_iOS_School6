//
//  ViewController.swift
//  18_02_08_test2
//
//  Created by 배지호 on 2018. 2. 8..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btn(_ sender: UIButton) {
        
        let alertVC = UIAlertController(title: "확인", message: "다음으로 넘어가시겠습니까?", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "네", style: .default) { (action) in
            //해당 버튼이 클릭되면 해야될 행동
            let nextVC = NextViewController()
            nextVC.view.backgroundColor = UIColor.black
            self.present(nextVC, animated: true, completion: nil)

        }
        
        let action2 = UIAlertAction(title: "아니요", style: .cancel) { (action) in
            //취소시 해야 할 행동
        }
        
        alertVC.addAction(action1)
        alertVC.addAction(action2)
        
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "NextViewController" {
            return false
        }else {
            return true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

