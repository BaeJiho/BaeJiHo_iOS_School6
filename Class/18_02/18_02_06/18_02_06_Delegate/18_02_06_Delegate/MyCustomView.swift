//
//  MyCustomView.swift
//  18_02_06_Delegate
//
//  Created by 배지호 on 2018. 2. 6..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MyCustomView: UIView {
    
    
    private var button: UIButton!
    
    var delegate:MyCustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.brown
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        button = UIButton()
        button.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        button.setTitle("버튼", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = self.bounds
        
        self.addSubview(button)
        
    }
    
    @objc func btnAction(_ sender: UIButton) {
        delegate?.didSelectedMyCustomView(self)
    }

}

protocol MyCustomViewDelegate {
    
    func didSelectedMyCustomView(_ customView: MyCustomView)
    
}
