//
//  DataViewController.swift
//  18_03_02_MyStudy
//
//  Created by 배지호 on 2018. 3. 2..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var descriptionLB: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    @IBOutlet weak var emailLB: UILabel!
    
    var detail: friends?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = detail {
            self.bgImg.image = UIImage(named: data.backgroundImage)
            self.profileImg.image = UIImage(named: data.profileImage)
            self.nameLB.text = data.nickName
            self.descriptionLB.text = data.profileDescription
            self.phoneNum.text = data.phoneNumber
            self.emailLB.text = data.email
        }
        // Do any additional setup after loading the view.
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
