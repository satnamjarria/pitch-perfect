//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Singh, Satnam on 2/24/15.
//  Copyright (c) 2015 Singh, Satnam. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController {
    var myPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!

    @IBAction func slowButtonAction(sender: UIButton) {
        println("pressed slow button")
        myPlayer.stop()
        myPlayer.currentTime = 0.0
        if sender.currentTitle == "slow"{
         println("slow")
        }
        myPlayer.rate = 0.5
        myPlayer.play()
    }
    @IBAction func stopPlayer(sender: UIButton) {
        myPlayer.stop()
    }
    
    @IBAction func chipmunkEffect(sender: UIButton) {
       playAudioWithVariablePitch(2000)
    }

    @IBAction func playDarthVaderSound(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    @IBAction func fastButtonAction(sender: UIButton) {
        myPlayer.stop()
        myPlayer.currentTime = 0.0
        myPlayer.rate = 1.5
        myPlayer.play()
    }
    func playAudioWithVariablePitch(pitch: Float){
        myPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        myPlayer = AVAudioPlayer(contentsOfURL:receivedAudio.filePathUrl, error:nil)
        myPlayer.enableRate = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
