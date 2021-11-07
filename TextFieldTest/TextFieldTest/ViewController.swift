//
//  ViewController.swift
//  TextFieldTest
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiTextField: EmojiTextField!
    
  
    
    var check = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

extension ViewController: UITextFieldDelegate {
    // 글자수제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        guard textField.text!.count < 1 else { return false }
        check = true
        return true
    }
    //
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if check == true {
          second.becomeFirstResponder()
        } else {
            second.resignFirstResponder()
        }
        return true
      }
}
