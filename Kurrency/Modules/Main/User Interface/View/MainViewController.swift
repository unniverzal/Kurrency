//
//  MainMainViewController.swift
//  Kurrency
//
//  Created by Ard Stavileci on 15/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import UIKit
import SwiftSiriWaveformView
import BAFluidView

class MainViewController: UIViewController, MainViewInterface {

	@IBOutlet weak var fluidView: BAFluidView!
    var eventHandler: MainModuleInterface!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureWaterView()
	}
	
	@IBAction func getStartedButtonAction(_ sender: Any) {
		eventHandler.getStartedButtonTapped()
	}

	
	func configureWaterView(){
		fluidView.minAmplitude = 30
		fluidView.fillColor = UIColor.white
		fluidView.maxAmplitude = 100
		fluidView.amplitudeIncrement = 5
		fluidView.fillDuration = 0.3
		fluidView.fillRepeatCount = 20
		fluidView.fillAutoReverse = false
		fluidView.startAnimation()
	}
	
}
