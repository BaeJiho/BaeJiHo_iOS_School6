//
//  NextViewController.swift
//  18_02_08_test2
//
//  Created by 배지호 on 2018. 2. 8..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func btnAction(_ sender: UIButton) {
        
        let alertV = UIAlertController(title: "확인", message: "다음으로 넘어가시겠습니까?", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "네", style: .default) { (action) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVCc = storyboard.instantiateViewController(withIdentifier: "customViewController") as! customViewController
            self.present(nextVCc, animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "아니요", style: .cancel) { (action) in
            
        }
        
        alertV.addAction(action1)
        alertV.addAction(action2)
        
        self.present(alertV, animated: true, completion: nil)
        
    }
    @IBAction func back(_ sender: UIButton) {
        
        let alertBack = UIAlertController(title: "확인", message: "뒤로 넘어가시겠습니까?", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "네", style: .default) { (action) in
            
            self.dismiss(animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "아니요", style: .cancel) { (action) in
            
        }
        
        alertBack.addAction(action1)
        alertBack.addAction(action2)
        
        self.present(alertBack, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
