//
//  ViewController.swift
//  18_03_19
//
//  Created by 배지호 on 2018. 3. 19..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var placeHolderLB: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let nextVCIdentity = "NextViewControllerModalSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.updateFocusIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
//    private func addKeyboardObserver() {
//        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: .main) {
//            [weak self] in
//            guard let userInfo = $0.userInfo,
//            let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
//            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
//            let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
//            else { return }
//
//            UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(rawValue: curve), animations: {
//                <#code#>
//            }, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
//        }
//    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction private func dismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    private var didUpdateConstraints = false
    override func updateViewConstraints() {
        if !didUpdateConstraints {
            didUpdateConstraints = true

            nextButton.translatesAutoresizingMaskIntoConstraints = false
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true

            dismissButton.translatesAutoresizingMaskIntoConstraints = false
            dismissButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
            dismissButton.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor).isActive = true
        }
        super.updateViewConstraints()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? NextViewController else {return}
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == nextVCIdentity, nextButton.isSelected else {
            return false
        }
        return true
    }
    
}

