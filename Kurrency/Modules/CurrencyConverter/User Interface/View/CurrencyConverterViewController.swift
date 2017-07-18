//
//  CurrencyConverterCurrencyConverterViewController.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController, CurrencyConverterViewInterface {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var currencyFromSymbol: UILabel!
	@IBOutlet weak var amountToConvertTextField: UITextField!
	@IBOutlet weak var currencyFromButton: UIButton!

	@IBOutlet weak var currencyToButton: UIButton!
	@IBOutlet weak var convertedAmountLabel: UILabel!
	@IBOutlet weak var currencyToSymbol: UILabel!
	
	@IBOutlet weak var convertCurrencyButton: UIButton!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	var currencyFrom : Currency!
	var currencyTo : Currency!
    var eventHandler: CurrencyConverterModuleInterface!

    override func viewDidLoad(){
		super.viewDidLoad()
		currencyFromButton.setTitle("Convert from", for: UIControlState.normal)
		currencyToButton.setTitle("Convert to", for: UIControlState.normal)
    }

	func setConvertFromCurrency(currency : Currency){
		currencyFrom = currency
		currencyFromSymbol.text = currency.currencySymbol
		currencyFromButton.setTitle(Utils.titleWithId(currencyId: currency.id), for: UIControlState.normal)
	}
	
	func setConvertToCurrency(currency : Currency){
		currencyTo = currency
		currencyToSymbol.text = currency.currencySymbol
		currencyToButton.setTitle(Utils.titleWithId(currencyId: currency.id), for: UIControlState.normal)
	}
	
	func set(convertedAmount : String){
		convertedAmountLabel.text = convertedAmount
		stopActivityIndicator()
	}
	
	func startActivityIndicator(){
		activityIndicator.startAnimating()
		convertCurrencyButton.isHidden = true
	}
	
	func stopActivityIndicator(){
		activityIndicator.stopAnimating()
		convertCurrencyButton.isHidden = false
	}
	
	@IBAction func currencyToButtonAction(_ sender: Any) {
		eventHandler.convertToButtonTapped()
	}

	@IBAction func currencyFromButtonAction(_ sender: Any) {
		eventHandler.convertFromButtonTapped()
	}
	
	@IBAction func covertCurrencyButtonAction(_ sender: Any) {
		eventHandler.convertCurrencyButtonTapped(currencyFrom : currencyFrom?.id , currencyTo : currencyTo?.id , amountToConvert : amountToConvertTextField.text)
	}
	@IBAction func scrollViewTapGestureAction(_ sender: Any) {
		amountToConvertTextField.resignFirstResponder()
	}

}
