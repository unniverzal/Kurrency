//
//  CurrenciesViewController.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/16/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import UIKit

class CurrenciesViewController: UIViewController, CurrenciesViewInterface, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!
	var eventHandler : CurrenciesModuleInterface!
	var type : CurrencyType = .convertFrom
	var currencies: [Currency] = []
	var searchBar: UISearchBar!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		eventHandler.currenciesViewLoaded()
		setupSearchBar()
		tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
		tableView.scrollIndicatorInsets = UIEdgeInsetsMake(-64, 0, 0, 0)
	}
	
	func set(currencies: [Currency]) {
		self.currencies = currencies
		tableView.reloadData()
	}
	
	private func setupSearchBar() {
		searchBar = UISearchBar()
		searchBar.sizeToFit()
		searchBar.placeholder = "Search"
		searchBar.delegate = self
		navigationItem.titleView = searchBar
		let textField : UITextField = searchBar.value(forKey: "searchField") as! UITextField
		textField.textColor = UIColor.backgroundColor()
		textField.tintColor = UIColor.backgroundColor()
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return currencies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)
		cell.textLabel?.text = Utils.titleWithName(currencyId: currencies[indexPath.row].id!, currencyName: currencies[indexPath.row].currencyName!)
		cell.detailTextLabel?.text = currencies[indexPath.row].currencySymbol
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		eventHandler.currencySelected(withType: type, currency: currencies[indexPath.row])
		self.navigationController?.popViewController(animated: true)
	}

	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView()
	}

	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 1
	}
}


// MARK: - UISearchBarDelegate implementation

extension CurrenciesViewController: UISearchBarDelegate {
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		eventHandler.searchBarTextChange(withText: searchText)
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
	}
}

enum CurrencyType {
    case convertFrom
    case convertTo
}
