//
//  InterfaceController.swift
//  KurrencyWatch Extension
//
//  Created by Ard Stavileci on 7/16/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import WatchKit
import Foundation
import ObjectMapper

class InterfaceController: WKInterfaceController {

	@IBOutlet var euroCurrencyLabel: WKInterfaceLabel!
	@IBOutlet var euroCurrencyValue: WKInterfaceLabel!
	@IBOutlet var currenciesTable: WKInterfaceTable!
	var convertedCurrencies : [ConvertedCurrency] = []
	
	override func awake(withContext context: Any?) {
        super.awake(withContext: context)
		euroCurrencyLabel.setText("🇪🇺EUR")
		euroCurrencyValue.setText("1€")
    }
    
    override func willActivate() {
        super.willActivate()
		requestTopCurrencies()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
	
	func requestTopCurrencies() {
		let params = ["apiKey": Constants.apiKey,"q": "EUR_USD,EUR_GBP,EUR_ALL,EUR_JPY"]
		NetworkService.shared.executeRequest(method: .get, url: Constants.convertCurrencyURL,parameters: params,onSucceed: { [weak self] (result: Result) in
			result.results?.forEach ({
				if let value = $0.value as? [String: Any]{
					let convertedCurrency = Mapper<ConvertedCurrency>().map(JSON: value)!
					self?.convertedCurrencies.append(convertedCurrency)
				}
			})
			self?.reloadCurrencyTable()
		}) { [weak self](error) in
			
		}
	}
	
	func reloadCurrencyTable() {
		currenciesTable.setNumberOfRows(convertedCurrencies.count, withRowType: "Currencies")
		for index in 0..<currenciesTable.numberOfRows {
			if let controller = currenciesTable.rowController(at: index) as? ConvertedCurrencyRowController {
				controller.currency = convertedCurrencies[index]
			}
		}
	}

}
