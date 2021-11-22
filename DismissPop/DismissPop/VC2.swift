//
//  VC2.swift
//  DismissPop
//
//  Created by ✨EUGENE✨ on 2021/01/03.
//

import UIKit

class VC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func pushClicked(_ sender: Any) {
        guard let nvc = self.storyboard?.instantiateViewController(withIdentifier: "VC3") as? VC3 else {
            return
        }
        self.navigationController?.pushViewController(nvc, animated: true)
    }

}
