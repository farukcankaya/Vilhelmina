//
//  RootWireframe.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe{
    
    private func mainStoryboard() -> UIStoryboard{
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    private func view(withIdentifier identifier: String) -> UIViewController?{
        return self.mainStoryboard().instantiateViewControllerWithIdentifier(identifier)
    }
    
    private func setupIntroView(with view:BootstrapView) -> BootstrapView{
        let dataManager = BootstrapDataManager()
        let interactor = BootstrapInteractor(withDataManager: dataManager)
        let presenter = BootstrapPresenter(withView: view, interactor: interactor, router: self)
        
        view.presenter = presenter
        interactor.presenter = presenter
        dataManager.interactor = interactor
        
        return view
    }
    
    func installRootView(into window: UIWindow){
        if var introView = self.view(withIdentifier: String(BootstrapView)) as? BootstrapView{
            introView = self.setupIntroView(with: introView)
            window.rootViewController = introView
        }
    }
    
    func showSubmissionsModule(){
        
    }
}