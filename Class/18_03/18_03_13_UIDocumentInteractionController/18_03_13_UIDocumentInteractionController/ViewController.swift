//
//  ViewController.swift
//  18_03_13_UIDocumentInteractionController
//
//  Created by 배지호 on 2018. 3. 13..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBAction func preView(_ sender: Any) {
        let filePath = NSTemporaryDirectory() + "test.txt"
        uiDocInteractionVC.url = Bundle.main.url(forResource: "movie", withExtension: ".jpeg")
        uiDocInteractionVC.presentPreview(animated: true)
    }
    
    @IBAction func sendBtn(_ sender: UIButton) {
       
    }
    
    lazy var uiDocInteractionVC: UIDocumentInteractionController = {
        let url = Bundle.main.url(forResource: "iPhone", withExtension: "png")
        let doc = UIDocumentInteractionController(url: url!)
        doc.delegate = self
        return doc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/test.txt"
        
        do {
            try ("FastCampus in IOS Developer" as NSString).write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8.rawValue)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

extension ViewController: UIDocumentInteractionControllerDelegate {
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
}
