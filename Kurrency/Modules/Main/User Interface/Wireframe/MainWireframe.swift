//
//  MainMainWireframe.swift
//  Kurrency
//
//  Created by Ard Stavileci on 15/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import UIKit

protocol MainRouter: class {
	func presentConvertCurrencyViewController()
}

class MainWireframe: MainRouter {

    weak var presentedViewController: MainViewController?
    weak var presenter: MainPresenter!

    func getViewController() -> UIViewController {
        let viewController = viewControllerFromStoryboard()
        viewController.eventHandler = presenter
        self.presentedViewController = viewController
        self.presenter.viewController = viewController
		return viewController
	}
    
    private func viewControllerFromStoryboard() -> MainViewController {
        let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "Main") as! MainViewController
    }
	
	func presentConvertCurrencyViewController() {
		let viewController  = CurrencyConverterModuleConfigurator.shared.initialize()
		viewController.modalTransitionStyle = .crossDissolve
		viewController.modalPresentationStyle = .overCurrentContext
		presentedViewController?.present(viewController, animated: true, completion: nil)
	}
	
    deinit {
        print("MainWireframe DEINIT")
    }
}
