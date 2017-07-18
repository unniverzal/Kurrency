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

    var eventHandler: MainModuleInterface!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func getStartedButtonAction(_ sender: Any) {
		eventHandler.getStartedButtonTapped()
	}
}
