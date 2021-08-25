//
//  ViewController.swift
//  FramePrac
//
//  Created by ✨EUGENE✨ on 2021/08/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        frame()
    }
    
    func frame() {
        let orange = UIView()
        view.addSubview(orange)
        view.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
        orange.backgroundColor = .orange
        orange.frame = CGRect(x: 20, y: 50, width: 728, height: 440)
        
        let pink = UIView()
        pink.backgroundColor = .magenta
        pink.frame = CGRect(x: 36, y: 36, width: 314, height: 372)
        
        orange.addSubview(pink)
        
        let gray = UIView()
        gray.backgroundColor = .gray
        gray.frame = CGRect(x: 182, y: 70, width: 512, height: 200)
        
        orange.addSubview(gray)
        
        print(view.frame, view.center)
        print(orange.frame, orange.center)
        print(pink.frame, pink.center)
        print(gray.frame, gray.center)
        
        orange.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.init(item: orange, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 8).isActive = true
        
        
        
        NSLayoutConstraint.init(item: orange, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint.init(item: orange, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -8).isActive = true
        NSLayoutConstraint.init(item: orange, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 100).isActive = true

    }
}
