//
//  EmojiTextField.swift
//  TextFieldTest
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit

class EmojiTextField: UITextField {
    
    
    //iOS 13일 때 필요
    override var textInputContextIdentifier: String? { "" }
    
//    override var textInputMode: UITextInputMode? {
//        for mode in UITextInputMode.activeInputModes {
//            if mode.primaryLanguage == "emoji" {
//                return mode
//            }
//        }
//        return nil
//    }
    
    
    override var textInputMode: UITextInputMode? {
            .activeInputModes.first(where: { $0.primaryLanguage == "emoji" })
        }

    override init(frame: CGRect) {
            super.init(frame: frame)
            
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            
            commonInit()
        }
        
        func commonInit() {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(inputModeDidChange),
                                                   name: UITextInputMode.currentInputModeDidChangeNotification,
                                                   object: nil)
        }

        @objc func inputModeDidChange(_ notification: Notification) {
            guard isFirstResponder else {
                return
            }

            DispatchQueue.main.async { [weak self] in
                self?.reloadInputViews()
            }
        }
}
