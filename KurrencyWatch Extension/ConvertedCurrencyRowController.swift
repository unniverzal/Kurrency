//
//  KurrencyRowController.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/17/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import WatchKit

class ConvertedCurrencyRowController: NSObject {

	@IBOutlet var currencyName: WKInterfaceLabel!
	@IBOutlet var currencyValue: WKInterfaceLabel!
	
	var currency : ConvertedCurrency? {
		didSet {
			if let currency = currency {
				currencyName.setText(Utils.titleWithId(currencyId: currency.to))
				currencyValue.setText(
					"\(String(format: "%.2f", currency.val))\(Utils.getSymbolForCurrencyCode(code: currency.to!)!)")
			}
		}
	}
}
