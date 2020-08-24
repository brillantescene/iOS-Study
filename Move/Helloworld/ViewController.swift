//
//  ViewController.swift
//  Helloworld
//
//  Created by 박유진 on 2020/08/21.
//  Copyright © 2020 박유진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Click_moveBtn(_ sender: Any) {
        //컨트롤러를 찾아. DetailController
        
        //그 컨트롤러를 담아놓을 변수
        //변수 종류 - let(상수. 변하지 x), var(변수. 변한다)
        // self.storyboard?.instantiateViewController(identifier: "DetailController") - 이 형식은 외우기
        // 옵셔널 바인딩 -> 이건 나중에 자세하게!
        // 값이 있을 수도 있고 없을 수도 있음. nil을 방지하기 위해 let 앞에 if 넣어주기
        // 변수 controller에 값이 있을 때 {}에 들어감
        if let controller = self.storyboard?.instantiateViewController(identifier: "DetailController") {
            // 여기서 navigation--이게 맨 앞에 있는 navigation임
            // 내가 속한 navigationController에 viewController를 push한다
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
        
    }
    
}

