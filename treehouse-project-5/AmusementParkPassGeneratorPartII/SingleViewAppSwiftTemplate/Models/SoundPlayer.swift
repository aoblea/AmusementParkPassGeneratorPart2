//
//  SoundPlayer.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 9/19/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation
import AVFoundation

class SoundPlayer {
  var soundPlayer: AVAudioPlayer?
  
  func playAcceptedSound() {
    let url = Bundle.main.url(forResource: "AccessGranted", withExtension: "wav")
  
    do {
      guard let url = url else { return } // url is nil
      soundPlayer = try AVAudioPlayer(contentsOf: url)
      guard let player = soundPlayer else { return } // soundplayer is nil
      
      player.prepareToPlay()
      player.play()
    } catch let error {
      print(error) // error creating the player
    }
  }
  
  func playDeniedSound() {
    let url = Bundle.main.url(forResource: "AccessDenied", withExtension: "wav")
    
    do {
      guard let url = url else { return } // url is nil
      soundPlayer = try AVAudioPlayer(contentsOf: url)
      guard let player = soundPlayer else { return } // soundplayer is nil
      
      player.prepareToPlay()
      player.play()
    } catch let error {
      print(error) // error creating the player
    }
  }
  
}
