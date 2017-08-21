//
//  FluidView.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/18/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import UIKit
import BAFluidView

class FluidView: BAFluidView {

	override func awakeFromNib() {
		super.awakeFromNib()
		configureWaterView()
	}
	
	func configureWaterView() {
		self.minAmplitude = 30
		self.fillColor = UIColor.white
		self.maxAmplitude = 100
		self.amplitudeIncrement = 5
		self.fillDuration = 0.3
		self.fillRepeatCount = 20
		self.fillAutoReverse = false
	}
}
