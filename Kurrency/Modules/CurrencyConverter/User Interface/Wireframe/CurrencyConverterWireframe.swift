//
//  CurrencyConverterCurrencyConverterWireframe.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import UIKit

protocol CurrencyConverterRouter: class {
	func presentCurrenciesViewController(with: CurrencyType)
}

class CurrencyConverterWireframe: CurrencyConverterRouter {

    weak var presentedViewController: CurrencyConverterViewController?
    weak var presenter: CurrencyConverterPresenter!

    func getViewController() -> UIViewController {
        let viewController = viewControllerFromStoryboard()
        viewController.eventHandler = presenter
        self.presentedViewController = viewController
        self.presenter.viewController = viewController
        return navigationController(viewController)
    }
	
	func presentCurrenciesViewController(with type: CurrencyType) {
		let viewController  = currenciesViewControllerFromStoryboard()
		viewController.type = type
		presenter.currenciesViewInterface = viewController
		viewController.eventHandler = presenter
		presentedViewController?.navigationController?.pushViewController(viewController, animated: true)
	}
	
	private func currenciesViewControllerFromStoryboard() -> CurrenciesViewController {
		let storyboard = UIStoryboard(name: "CurrencyConverterStoryboard", bundle: nil)
		return storyboard.instantiateViewController(withIdentifier: "Currencies") as! CurrenciesViewController
	}
	
	fileprivate func navigationController(_ root: UIViewController) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: root)
		return navigationController
	}

	
    private func viewControllerFromStoryboard() -> CurrencyConverterViewController {
        let storyboard = UIStoryboard(name: "CurrencyConverterStoryboard", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CurrencyConverter") as! CurrencyConverterViewController
    }

    deinit{
        print("CurrencyConverterWireframe DEINIT")
    }
}
