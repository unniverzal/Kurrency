//
//  BackgroundView.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/15/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import Foundation
import UIKit

class BackgroundGradientView: UIView {
	
	override func awakeFromNib() {
		
		if let gradientLayer = self.layer as? CAGradientLayer{
			
			gradientLayer.colors = [UIColor(red: 57/255, green: 177/255, blue: 255/255, alpha: 1).cgColor, UIColor(red: 48/255, green: 208/255, blue: 254/255, alpha: 1).cgColor]
			gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
			gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
			
		}
	}
	
	override class var layerClass : AnyClass {
		return CAGradientLayer.self
	}
}
