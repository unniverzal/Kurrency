//
//  Utils.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/16/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import Foundation

class Utils {
	
	static func titleWithId(currencyId : String) -> String{
		let currencyFlag = flagOf(currency: String(currencyId.characters.dropLast()))
		return "\(currencyFlag) \(currencyId)"
	}
	
	static func titleWithName(currencyId : String,currencyName : String) -> String{
		let currencyFlag = flagOf(currency: String(currencyId.characters.dropLast()))
		return "\(currencyFlag) \(currencyName)"
	}

	static func flagOf(currency: String) -> String {
		let base : UInt32 = 127397
		var flag = ""
		for v in currency.unicodeScalars {
			flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
		}
		return String(flag)
	}
	
	static func getSymbolForCurrencyCode(code: String) -> String? {
		let locale = NSLocale(localeIdentifier: code)
		return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code)
	}
}
