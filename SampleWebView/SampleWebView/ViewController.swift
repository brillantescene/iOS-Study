//
//  ViewController.swift
//  SampleWebView
//
//  Created by 박유진 on 2020/08/27.
//  Copyright © 2020 박유진. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString) {
            let urlReq = URLRequest(url: url)
            WebViewMain.load(urlReq)
        }
        
    }


}

