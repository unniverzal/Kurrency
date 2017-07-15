//
//  MainMainPresenter.swift
//  Kurrency
//
//  Created by Ard Stavileci on 15/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//
import UIKit

class MainPresenter: MainModuleInterface, MainInteractorOutput {

    weak var viewController : UIViewController!
    var interactor: MainInteractorInput!
    var router: MainRouter!

}
