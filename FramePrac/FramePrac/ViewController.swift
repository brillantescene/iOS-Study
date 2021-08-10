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
        let aView = UIView()
        view.addSubview(aView)
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.backgroundColor = .blue

        
        NSLayoutConstraint.init(item: aView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 8).isActive = true
        NSLayoutConstraint.init(item: aView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint.init(item: aView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -8).isActive = true
        NSLayoutConstraint.init(item: aView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 100).isActive = true
    }
}

