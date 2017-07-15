//
//  MainMainModuleConfigurator.swift
//  Kurrency
//
//  Created by Ard Stavileci on 15/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import UIKit

class MainModuleConfigurator{
    
    static let shared = MainModuleConfigurator()
    
    private init() {
    
    }
    
    func initialize() -> UIViewController {
        
        let wireframe = MainWireframe()
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        
        wireframe.presenter = presenter
        
        presenter.router = wireframe
        presenter.interactor = interactor
        
        interactor.output = presenter

        return wireframe.getViewController()
    }
}