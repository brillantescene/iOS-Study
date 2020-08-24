//
//  ViewController.swift
//  MoveToColorPage
//
//  Created by 박유진 on 2020/08/22.
//  Copyright © 2020 박유진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func red_btn(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(identifier: "RedController") {
            self.navigationController?.pushViewController(controller, animated: true)
            print("Go to Red screen!")
        }
        
    }
    
    @IBAction func blue_btn(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(identifier: "BlueController") {
            self.navigationController?.pushViewController(controller, animated: true)
            print("Go to Blue screen!")
        }
    }
}

