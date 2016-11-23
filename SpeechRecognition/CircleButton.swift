//
//  CircleButton.swift
//  SpeechRecognition
//
//  Created by Tomas-William Haffenden on 23/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//


//Setup for GUI to allow for corner radius to be seen in storyboard
import UIKit

class CircleButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }

}
