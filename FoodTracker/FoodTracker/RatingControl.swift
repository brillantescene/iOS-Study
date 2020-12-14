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
        
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(systemName: "star.fill")
        let emptyStar = UIImage(systemName: "star")
        let highlightedStar = UIImage(named:"star.fill")
        
        
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
//            button.backgroundColor = UIColor.red
            
            button.setImage(emptyStar, for: .normal)
                    button.setImage(filledStar, for: .selected)
                    button.setImage(highlightedStar, for: .highlighted)
                    button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
    
    //MARK: Properties
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
     
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
}
