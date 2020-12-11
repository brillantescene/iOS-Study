//
//  RatingControl.swift
//  FoodTracker
//
//  Created by ✨EUGENE✨ on 2020/12/10.
//

import UIKit

class RatingControl: UIStackView {

    override init(frame: CGRect){
        super.init(frame: frame)
        setupButtons()

    }

    required init(coder: NSCoder){
        super.init(coder: coder)
        setupButtons()

    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        
        // Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
        
        // Add the button to the stack
        addArrangedSubview(button)
    }
}
