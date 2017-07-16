//
//  CurrencyConverterCurrencyConverterModuleInteface.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

typealias CurrencyConverterMainModuleInterface = CurrencyConverterModuleInterface & CurrenciesModuleInterface

protocol CurrencyConverterModuleInterface: class {

	func convertFromButtonTapped()
	
	func convertToButtonTapped()
	
	func convertCurrencyButtonTapped(currencyFrom : Currency? , currencyTo : Currency? , amountToConvert : String?)
}

extension CurrencyConverterModuleInterface where Self:CurrencyConverterPresenter{
    
    var userInterface : CurrencyConverterViewInterface?{
        
        if let userInterface = self.viewController as? CurrencyConverterViewInterface{
            return self.viewController.isViewLoaded ? userInterface : nil
        }
        
        return nil
    }
}

protocol CurrenciesModuleInterface : class {
	
	func currenciesViewLoaded()
	
	func currencySelected(withType: CurrencyType, currency: Currency)
	
	func searchBarTextChange(withText: String)
}
