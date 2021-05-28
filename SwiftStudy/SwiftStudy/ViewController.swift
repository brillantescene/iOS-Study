//
//  ViewController.swift
//  SwiftStudy
//
//  Created by ✨EUGENE✨ on 2021/05/28.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        structTest()
        classTest()
    }
    
    func structTest() {
        var eugeneInfo = BasicInformation(name: "eugene", age: 99)
        eugeneInfo.age = 25
        
        // eugeneInfo의 값을 복사하여 할당
        var friendInfo = eugeneInfo
        
        print("eugene's age \(eugeneInfo.age)")
        print("friend's age \(friendInfo.age)")
        
        changeBasicInfo(eugeneInfo)
        print("changeBasicInfo후 eugene's age \(eugeneInfo.age)")
    }
    
    func classTest() {
        var eugene = Person()
        var friend = eugene
        
        print("eugene's height \(eugene.height)")
        print("friend's height \(friend.height)")
        
//        eugene.height = 171.0
        friend.height = 171.0
        
        print("eugene's height \(eugene.height)")
        print("friend's height \(friend.height)")
        
        changePersonInfo(eugene)
        print("changePersonInfo후 eugene's height \(eugene.height)")
        
    }

    func changeBasicInfo(_ info: BasicInformation) {
        var copiedInfo: BasicInformation = info
        copiedInfo.age = 1
    }

    func changePersonInfo(_ info: Person) {
        info.height = 163.3
    }
}

