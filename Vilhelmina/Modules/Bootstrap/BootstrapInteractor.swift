//
//  IntroInteractor.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

protocol BootstrapInteractorInputProtocol{
    weak var dataManager: BootstrapDataManager? { get set }
    var presenter: BootstrapPresenter? { get set }
    
    func initiateDataExchangeSequence()
}

protocol BootstrapInteractorOutputProtocol{
    associatedtype APIInfo
    
    func receivedAccessToken(info: APIInfo)
    func receivedProjects(info: APIInfo)
    func receivedProjectTaskforms(info: APIInfo)
    func receivedProjectTaskformSubmissions(info: APIInfo)
}

class BootstrapInteractor: BootstrapInteractorInputProtocol{
    weak var dataManager: BootstrapDataManager?
    var presenter: BootstrapPresenter?
    
    init(withDataManager dataManager: BootstrapDataManager){
        self.dataManager = dataManager
    }
    
    //MARK: IntroInteractorInputProtocol
    func initiateDataExchangeSequence(){
        
    }
    
}