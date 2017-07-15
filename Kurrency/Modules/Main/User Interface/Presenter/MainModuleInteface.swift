//
//  MainMainModuleInteface.swift
//  Kurrency
//
//  Created by Ard Stavileci on 15/07/2017.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

protocol MainModuleInterface: class {

}

extension MainModuleInterface where Self:MainPresenter{
    
    var userInterface : MainViewInterface?{
        
        if let userInterface = self.viewController as? MainViewInterface{
            return self.viewController.isViewLoaded ? userInterface : nil
        }
        
        return nil
    }
}
