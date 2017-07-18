//
//  CurrencyConverterCurrencyConverterInteractor.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import ObjectMapper
import CoreData
class CurrencyConverterInteractor: CurrencyConverterInteractorInput {

    weak var output: CurrencyConverterInteractorOutput!
	var currencies : [Currency] = [] {
		didSet{
			output.set(currencies : currencies.sorted(by: {$0.currencyName < $1.currencyName}))
		}
	}
	
	init(){
		requestCurrencies()
		currencies = CoreDataServices.shared.fetchCurrenciesFromCoreData()
	}
	
	func requestCurrencies(){
		let params = ["apiKey" : Constants.apiKey]
		NetworkService.shared.executeRequest(method: .get, url: Constants.currenciesURL,parameters : params,onSucceed: { [weak self](result : Result) in
			result.results?.forEach({
				if let value = $0.value as? [String:Any],let id = value["id"] as? String, CoreDataServices.shared.checkIfCurrencyExists(withId: id){
					let currency = Mapper<Currency>().map(JSON:value)!
					self?.currencies.append(currency)
				}
			})
		}) { [weak self](error) in
			self?.output.showErroMessage(message: "Failed to fetch Currencies")
		}
	}
	
	func getCurrencies(startingWith text: String) {
		output.set(currencies: currencies.filter({$0.currencyName!.hasPrefix(text)}).sorted(by: {$0.currencyName < $1.currencyName}))
	}
	
	func convertCurrency(from : String , to : String , amount : String){
		let params = ["apiKey" : Constants.apiKey,
		              "compact" : "ultra",
		              "q":"\(from)_\(to)"]
		NetworkService.shared.executeRequest(method: .get, url: Constants.convertCurrencyURL, parameters:params, onSucceed: { [weak self](dict) in
			if let value = dict.first?.value as? Double{
				self?.output.set(convertedAmount: Double(amount)!*value)
			}
		}) { [weak self](error) in
			self?.output.showErroMessage(message: "Failed to convert currency")
		}
	}
	
	

}
