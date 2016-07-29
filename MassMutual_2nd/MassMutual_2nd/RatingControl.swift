//
//  RatingControl.swift
//  MassMutual_2nd
//
//  Created by Tiancong Gu on 3/29/16.
//  Copyright © 2016 Tiancong Gu. All rights reserved.
//
/*********************************
 like or donot like an article
 ********************************/

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledLikeImage = UIImage(named: "filledLike")
        let emptyLikeImage = UIImage(named: "emptyLike")
        
        let button = UIButton()
        
        button.setImage(emptyLikeImage, forState: .Normal)
        button.setImage(filledLikeImage, forState: .Selected)
        button.setImage(filledLikeImage, forState: [.Highlighted, .Selected])
        
        button.adjustsImageWhenHighlighted = false
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
        ratingButtons += [button]
        addSubview(button)
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        rating = rating + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = rating%2 == 1
        }
    }
}
