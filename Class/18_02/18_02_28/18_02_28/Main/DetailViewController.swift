//
//  DetailViewController.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 2. 28..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var userData: UserModel?
    
    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var profileImgView: UIImageView!
    
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var descriptionLB: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    @IBOutlet weak var emailLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userData = userData {
            bgImgView.image = UIImage(named: userData.bgImgUrl)
            profileImgView.image = UIImage(named: userData.profileImgUrl)
            nickName.text = userData.nickName
            descriptionLB.text = userData.profileDescription
            phoneNum.text = userData.phoneNumber
            emailLB.text = userData.email
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImgView.layer.cornerRadius = profileImgView.frame.size.width / 2
        profileImgView.clipsToBounds = true
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
