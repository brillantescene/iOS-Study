//
//  VC3.swift
//  DismissPop
//
//  Created by ✨EUGENE✨ on 2021/01/03.
//

import UIKit

class VC3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func popClicked(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }

}
