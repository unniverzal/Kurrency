//
//  Utils.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/16/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import Foundation
import BRYXBanner

class Utils {
	
	static func titleWithId(currency : Currency) -> String{
		let currencyFlag = flagOf(currency: String(currency.id.characters.dropLast()))
		return "\(currencyFlag) \(currency.id!)"
	}
	
	static func titleWithName(currency : Currency) -> String{
		let currencyFlag = flagOf(currency: String(currency.id.characters.dropLast()))
		return "\(currencyFlag) \(currency.currencyName!)"
	}

	static func flagOf(currency: String) -> String {
		let base : UInt32 = 127397
		var flag = ""
		for v in currency.unicodeScalars {
			flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
		}
		return String(flag)
	}
	
	static func showMessage(message : String, tapAction : (()->Void)? = nil){
		
		let banner = Banner(title: "Something went wrong", subtitle: message, image: nil, backgroundColor: UIColor.red)
		banner.dismissesOnTap = true
		banner.didTapBlock = tapAction
		banner.show(duration: 5.0)
	}

}
