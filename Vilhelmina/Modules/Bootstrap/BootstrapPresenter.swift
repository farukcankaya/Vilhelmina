//
//  IntroPresenter.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

protocol BootstrapPresenterProtocol{
    weak var interactor: BootstrapInteractor? { get set }
    var view: BootstrapView? { get set }
    
    func updateView()
}

class BootstrapPresenter: Routable, BootstrapPresenterProtocol{
    var router: RootWireframe?
    
    weak var interactor: BootstrapInteractor?
    var view: BootstrapView?
    
    init(withView view:BootstrapView, interactor:BootstrapInteractor, router:RootWireframe){
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
    //MARK: IntroPresenterProtocol Methods
    func updateView() {
        interactor?.initiateDataExchangeSequence()
    }
    
    //MARK: IntroInteractorOutputProtocol Methods
}