//
//  CurrencyConverterCurrencyConverterViewInterface.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

protocol CurrencyConverterViewInterface: class {
	
	func setConvertFromCurrency(currency : Currency)
	
	func setConvertToCurrency(currency : Currency)
	
	func set(convertedAmount : String)
	
	func stopActivityIndicator()
	
	func startActivityIndicator()
}
