//
//  ViewController.swift
//  Holodoc23
//
//  Created by Saurabh Sikka on 18/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import UIKit
import AVFoundation
import TextToSpeechV1

class ViewController: UIViewController {
     let tts = TextToSpeech(username: "1ef14235-4608-4035-a929-cd95905d74ec", password: "1KiHAMEFriYj")
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func speakKlingon(sender: UIButton) {
        tts.synthesize("Today is a good day to die",
                       //voice: SynthesisVoice.GB_Kate,
                       audioFormat: AudioFormat.WAV,
                       failure: { error in
                        print("error was generated \(error)")
        }) { data in
            
            do {
                self.player = try AVAudioPlayer(data: data)
                self.player!.play()
            } catch {
                print("Couldn't create player.")
            }
            
        }
    }


}

