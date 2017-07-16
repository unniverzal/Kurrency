//
//  MainMainViewController.swift
//  Kurrency
//
//  Created by Ard Stavileci on 15/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import UIKit
import SwiftSiriWaveformView

class MainViewController: UIViewController, MainViewInterface {

	@IBOutlet weak var waterWaveAnimationView: SwiftSiriWaveformView!
    var eventHandler: MainModuleInterface!
	var timer:Timer?
	var change:CGFloat = 0.02
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureWateView()
	}
	
	@IBAction func getStartedButtonAction(_ sender: Any) {
		eventHandler.getStartedButtonTapped()
	}

	func configureWateView(){
		waterWaveAnimationView.amplitude = 1.1
		waterWaveAnimationView.phaseShift = -0.1
		waterWaveAnimationView.density = 2
		waterWaveAnimationView.frequency = 3
		waterWaveAnimationView.numberOfWaves = 1
		waterWaveAnimationView.idleAmplitude = 1.1
		timer = Timer.scheduledTimer(timeInterval: 0.009, target: self, selector: #selector(MainViewController.refreshAudioView(_:)), userInfo: nil, repeats: true)
	}
	
	@objc private func refreshAudioView(_:Timer) {
		if waterWaveAnimationView.amplitude <= waterWaveAnimationView.idleAmplitude || waterWaveAnimationView.amplitude > 1.0 {
			self.change *= -1.0
		}
		waterWaveAnimationView.amplitude += self.change
	}
	
	deinit {
		timer?.invalidate()
	}
}
