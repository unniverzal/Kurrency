//
//  CurrencyConverterCurrencyConverterPresenter.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//
import UIKit

class CurrencyConverterPresenter: CurrencyConverterMainModuleInterface, CurrencyConverterInteractorOutput {

    weak var viewController : UIViewController!
    var interactor: CurrencyConverterInteractorInput!
    var router: CurrencyConverterRouter!
	var currenciesViewInterface : CurrenciesViewInterface?

	func convertToButtonTapped() {
		router.presentCurrenciesViewController(withType: .convertTo)
	}
	
	func convertFromButtonTapped() {
		router.presentCurrenciesViewController(withType: .convertFrom)
	}
	
	func currenciesViewLoaded(){
		interactor.getCurrencies(startingWith: "")
	}
	
	func searchBarTextChange(withText text: String){
		interactor.getCurrencies(startingWith: text)
	}
	
	func set(currencies : [Currency]){
		currenciesViewInterface?.set(currencies: currencies)
	}
	
	func set(convertedAmount: Double) {
		userInterface?.stopActivityIndicator()
		userInterface?.set(convertedAmount: String(convertedAmount))
	}
	
	func currencySelected(withType type: CurrencyType, currency: Currency) {
		if type == .convertTo {
			userInterface?.setConvertToCurrency(currency: currency)
		}else {
			userInterface?.setConvertFromCurrency(currency: currency)
		}
	}
	
	func showErroMessage(message : String){
		Utils.showMessage(message: message)
	}
	
	func convertCurrencyButtonTapped(currencyFrom: Currency?, currencyTo: Currency?, amountToConvert: String?) {
		if currencyFrom == nil {
			showErroMessage(message: "You must select a curency to convert from")
			return
		}else if currencyTo == nil {
			showErroMessage(message: "You must select a curency to convert to")
			return
		}else if amountToConvert == nil || amountToConvert!.isEmpty {
			showErroMessage(message: "You must add amount to convert")
			return
		}
		userInterface?.startActivityIndicator()
		interactor.convertCurrency(from: currencyFrom!, to: currencyTo!, amount: amountToConvert!)
	}
	
}
