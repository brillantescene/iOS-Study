//
//  ViewController.swift
//  DismissPop
//
//  Created by ✨EUGENE✨ on 2021/01/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushClicked(_ sender: Any) {
        guard let nvc = self.storyboard?.instantiateViewController(withIdentifier: "VC2") as? VC2 else {
            return
        }
        self.navigationController?.pushViewController(nvc, animated: true)
    }
    
}

