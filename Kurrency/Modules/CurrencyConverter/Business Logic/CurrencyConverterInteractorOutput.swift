//
//  CurrencyConverterCurrencyConverterInteractorOutput.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

protocol CurrencyConverterInteractorOutput : class{

	func set(currencies : [Currency])
	
	func set(convertedAmount : Double)
	
	func showErroMessage(message : String)
}
