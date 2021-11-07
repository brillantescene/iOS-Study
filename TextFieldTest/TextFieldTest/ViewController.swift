//
//  ViewController.swift
//  TextFieldTest
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiTextField: EmojiTextField!
    
    @IBOutlet weak var codeTextField: OneTimeCodeTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeTextField.configure()
        codeTextField.didEnterLastDigit = { [weak self] code in
            print(code)
        }
    }


}

//extension ViewController: UITextFieldDelegate {
//}
