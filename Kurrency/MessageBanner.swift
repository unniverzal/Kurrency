//
//  Banner.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/17/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import Foundation
import UIKit
import BRYXBanner

class MessageBanner {
	
	static func showMessage(message : String, tapAction : (()->Void)? = nil){
		
		let banner = Banner(title: "Something went wrong", subtitle: message, image: nil, backgroundColor: UIColor.red)
		banner.dismissesOnTap = true
		banner.didTapBlock = tapAction
		banner.show(duration: 5.0)
	}
}
