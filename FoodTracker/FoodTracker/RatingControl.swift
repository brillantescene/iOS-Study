//
//  RatingControl.swift
//  FoodTracker
//
//  Created by ✨EUGENE✨ on 2020/12/10.
//

import UIKit

class RatingControl: UIStackView {

    private var ratingButtons = [UIButton]()
     
    var rating = 0
    
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
        
        for _ in 0..<5 {
            // Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
}
