//
//  CurrencyConverterCurrencyConverterInteractorInput.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

protocol CurrencyConverterInteractorInput {
	
	func getCurrencies(startingWith : String)
	
	func convertCurrency(from : Currency , to : Currency , amount : String)

}
