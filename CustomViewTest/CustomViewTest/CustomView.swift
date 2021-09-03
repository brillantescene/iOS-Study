//
//  CustomView.swift
//  CustomViewTest
//
//  Created by ✨EUGENE✨ on 2021/09/02.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var testVIew: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit() {
        if let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
             addSubview(view)
        }
    }
}
