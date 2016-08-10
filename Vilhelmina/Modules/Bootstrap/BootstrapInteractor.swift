//
//  IntroInteractor.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

protocol BootstrapInteractorInputProtocol{
    var dataManager: BootstrapDataManager? { get set }
    weak var presenter: BootstrapPresenter? { get set }
    
    func initiateDataExchangeSequence()
}

protocol BootstrapInteractorOutputProtocol{
    func didReceiveLoginResponse(withSuccess:Bool, error:NSError?)
    
    func didReceiveProjectsResponse(withSuccess:Bool, error:NSError?)
    func didSwitchedTo(project project:ProjectItem)
    func didFoundZeroProjectsWithSubmissions()
    func didFoundZeroProjects()
    
    func didReceiveProjectTaskformsResponse(withSuccess:Bool, items:[ProjectTaskformItem]?, error:NSError?)
}

class BootstrapInteractor: BootstrapInteractorInputProtocol{
    var dataManager: BootstrapDataManager?
    weak var presenter: BootstrapPresenter?
    
    init(withDataManager dataManager: BootstrapDataManager){
        self.dataManager = dataManager
    }
    
    //MARK: IntroInteractorInputProtocol
    func initiateDataExchangeSequence(){
        dataManager?.login()
    }
    
    func getAProjectWithSubmissions(items: [ProjectItem]) -> ProjectItem?{
        let filteredItems = items.filter({
            $0.submissionsCount > 0
        })
        
        if filteredItems.count > 0 {
            return filteredItems.first!
        }
        
        return nil
    }
}

extension BootstrapInteractor: BootstrapDataManagerOutputProtocol{
    
    func didReceiveLoginResponse(withSuccess:Bool, error:NSError?){
        presenter?.didReceiveLoginResponse(withSuccess, error: nil)
        
        if withSuccess{
            dataManager?.getProjects()
        }
    }
    
    func didReceiveProjectsResponse(withSuccess:Bool, items:[ProjectItem]?, error:NSError?){
        presenter?.didReceiveProjectsResponse(withSuccess, error: error)
        
        if withSuccess{
            if let items = items where items.count > 0{
                if let aProject = self.getAProjectWithSubmissions(items){
                    presenter?.didSwitchedTo(project: aProject)
                    dataManager?.getTaskforms(of: aProject)
                }else{
                    presenter?.didFoundZeroProjectsWithSubmissions()
                }
            }else{
                presenter?.didFoundZeroProjects()
            }
        }
    }
    
    func didReceiveProjectTaskformsResponse(withSuccess:Bool, taskforms:[ProjectTaskformItem]?, error:NSError?){
        presenter?.didReceiveProjectTaskformsResponse(withSuccess, items: taskforms, error: error)
    }
}