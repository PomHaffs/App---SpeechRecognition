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

//Added AvAudioPlayerDelegate
class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var ActivitySpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var TranscriptionTextField: UITextView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       ActivitySpinner.isHidden = true
    }

//This searches for the player and stops it
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        ActivitySpinner.stopAnimating()
        ActivitySpinner.isHidden = true
    }
    
    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
//This DO block players the audio
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        self.audioPlayer.delegate = self
                        sound.play()
                    } catch {
                        print("Error!!!")
                    }
//This is starting the transcription process
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                        print("There was an error \(error)")
                        } else {
                            self.TranscriptionTextField.text = result?.bestTranscription.formattedString
                        }
                    }
                }
            }
        }

    }
//On pushing button we have started the animation for the spinner

    @IBAction func playButtonPressed(_ sender: Any) {
        print("got to this")
        ActivitySpinner.isHidden = false
        ActivitySpinner.startAnimating()
        requestSpeechAuth()
    }
    
    
    
}




















