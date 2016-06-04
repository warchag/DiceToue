//
//  ViewController.swift
//  DiceToue
//
//  Created by BILLY on 6/1/16.
//  Copyright © 2016 BILLY. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	@IBOutlet weak var output:UILabel!
	@IBOutlet weak var imag:UIImageView!
	var number:Int = 0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	var audioPlayer:AVAudioPlayer!
	@IBAction func dice(sender:UIButton) {
		
		number = Int(arc4random_uniform(6)) + 1
		if number != 0 {
		
			changephoto(number)
			
			output.text = "ผลลัพคือ = \(number)"
		
			
		//music()
			
			
			if let soundURL = NSBundle.mainBundle().URLForResource("click_one", withExtension: "wav") {
    var mySound: SystemSoundID = 0
    AudioServicesCreateSystemSoundID(soundURL, &mySound)
    // Play
    AudioServicesPlaySystemSound(mySound);
			}
			
			
			
		}else{

		}

		
	}
	

	
	func music()
	{
		
		let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("click_one", ofType: "wav")!)
		
		do {
			// Preperation
			try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
		} catch _ {
		}
		do {
			try AVAudioSession.sharedInstance().setActive(true)
		} catch _ {
		}
		
		// Play the sound
		do {
			audioPlayer = try AVAudioPlayer(contentsOfURL: alertSound)
		} catch _{
		}
		
		audioPlayer.prepareToPlay()
		audioPlayer.play()
		
	}

	func changephoto(value:Int)  {
		
		switch value {
			
		case 1:
				imag.image = UIImage(named: "dice1");
			break
		case 2:
				imag.image = UIImage(named: "dice2");
			break
		case 3:
				imag.image = UIImage(named: "dice3");
			break
		case 4:
				imag.image = UIImage(named: "dice4");
			break
		case 5:
				imag.image = UIImage(named: "dice5");
			break
		case 6:
				imag.image = UIImage(named: "dice6");
			break
		default:0

		}
		
	}


}

