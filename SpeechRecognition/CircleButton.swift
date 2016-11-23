//
//  CircleButton.swift
//  SpeechRecognition
//
//  Created by Tomas-William Haffenden on 23/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//


//Setup for GUI to allow for corner radius to be seen in storyboard
import UIKit
//This is needed for ref
@IBDesignable
class CircleButton: UIButton {

    func setupView() {
        layer.cornerRadius = cornerRadius
    }
    
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet{
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }

}
