//
//  CurrencyConverterCurrencyConverterPresenter.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//
import UIKit

class CurrencyConverterPresenter: CurrencyConverterMainModuleInterface, CurrencyConverterInteractorOutput {

    weak var viewController: UIViewController!
    var interactor: CurrencyConverterInteractorInput!
    var router: CurrencyConverterRouter!
	var currenciesViewInterface: CurrenciesViewInterface?
	
	func set(currencies: [Currency]) {
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
	
	func showErroMessage(message: String) {
		MessageBanner.showMessage(message: message)
	}
	
	func convertToButtonTapped() {
		router.presentCurrenciesViewController(with: .convertTo)
	}
	
	func convertFromButtonTapped() {
		router.presentCurrenciesViewController(with: .convertFrom)
	}
	
	func convertCurrencyButtonTapped(currencyFrom: String?, currencyTo: String?, amountToConvert: String?) {
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
	
	func currenciesViewLoaded() {
		interactor.getCurrencies(startingWith: "")
	}
	
	func searchBarTextChange(withText text: String) {
		interactor.getCurrencies(startingWith: text)
	}

}
