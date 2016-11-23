//
//  ViewController.swift
//  SpeechRecognition
//
//  Created by Tomas-William Haffenden on 23/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit
//These two added in for speech framework
import Speech
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var ActivitySpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var TranscriptionTextField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       ActivitySpinner.isHidden = true
    }

    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                
            }
        }
    }

}

