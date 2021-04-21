//
//  PopUpVC.swift
//  ProtocolTest
//
//  Created by ✨EUGENE✨ on 2021/04/21.
//

import UIKit

class PopUpVC: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var cellNumLabel: UILabel!
    
    var cellNum: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 10
        cellNumLabel.text = cellNum
    }
    
    @IBAction func touchConfirmButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
