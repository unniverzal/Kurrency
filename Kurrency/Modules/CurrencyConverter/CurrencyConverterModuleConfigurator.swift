//
//  CurrencyConverterCurrencyConverterModuleConfigurator.swift
//  Kurrency
//
//  Created by Ard Stavileci on 16/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import UIKit

class CurrencyConverterModuleConfigurator{
    
    static let shared = CurrencyConverterModuleConfigurator()
    
    private init() {
    
    }
    
    func initialize() -> UIViewController {
        
        let wireframe = CurrencyConverterWireframe()
        let presenter = CurrencyConverterPresenter()
        let interactor = CurrencyConverterInteractor()
        
        wireframe.presenter = presenter
        
        presenter.router = wireframe
        presenter.interactor = interactor
        
        interactor.output = presenter

        return wireframe.getViewController()
    }
}