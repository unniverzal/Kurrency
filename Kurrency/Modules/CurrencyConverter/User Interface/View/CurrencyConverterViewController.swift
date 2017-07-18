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
	@IBOutlet weak var fluidViewBottomConstraint: NSLayoutConstraint!
	
	var currencyFrom : Currency!
	var currencyTo : Currency!
    var eventHandler: CurrencyConverterModuleInterface!

    override func viewDidLoad(){
		super.viewDidLoad()
		currencyFromButton.setTitle("Convert from", for: UIControlState.normal)
		currencyToButton.setTitle("Convert to", for: UIControlState.normal)
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		NotificationCenter.default.addObserver(self, selector:#selector(CurrencyConverterViewController.keyboardWillshow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector:#selector(CurrencyConverterViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(true)
		NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillShow)
		NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillHide)
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
	
	func keyboardWillshow(_ sender : Notification){
		let userInfo: NSDictionary = sender.userInfo! as NSDictionary
		let keyboardInfo = userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue
		let keyboardSize = keyboardInfo.cgRectValue.size
		fluidViewBottomConstraint.constant = keyboardSize.height
		UIView.animate(withDuration: 0.25, animations: { () -> Void in
			self.view.layoutIfNeeded()
		})
	}
	
	func keyboardWillHide(_ sender : Notification) {
		fluidViewBottomConstraint.constant = 0
		UIView.animate(withDuration: 0.25, animations: { () -> Void in
			self.view.layoutIfNeeded()
		})
	}


}
