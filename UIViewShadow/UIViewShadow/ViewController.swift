//
//  ViewController.swift
//  UIViewShadow
//
//  Created by ✨EUGENE✨ on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShadow()
    }

}
extension ViewController {
    func setShadow() {
        subView.layer.shadowColor = UIColor.black.cgColor
        subView.layer.shadowOpacity = 0.7
        subView.layer.shadowOffset = CGSize(width: 0.0, height: -4.0)
        subView.layer.shadowRadius = 12
        subView.layer.masksToBounds = false
    }
}
