//
//  IntroPresenter.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

protocol BootstrapPresenterProtocol{
    var interactor: BootstrapInteractor? { get set }
    weak var view: BootstrapView? { get set }
    
    func updateView()
}

class BootstrapPresenter: Routable, BootstrapPresenterProtocol{
    var router: RootWireframe?
    
    var interactor: BootstrapInteractor?
    weak var view: BootstrapView?
    
    init(withView view:BootstrapView, interactor:BootstrapInteractor, router:RootWireframe){
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
    //MARK: IntroPresenterProtocol Methods
    func updateView() {
        interactor?.initiateDataExchangeSequence()
    }
    
    func errorMessage(with context:String, error:NSError) -> String{
        let errorMessage = NSString(format: "An error occured during %@. (%@)", context, error.localizedDescription)
        return errorMessage as String
    }
}

extension BootstrapPresenter: BootstrapInteractorOutputProtocol{
    
    func didReceiveLoginResponse(withSuccess:Bool, error:NSError?){
        if let error = error {
            view?.show(message: self.errorMessage(with: "token retrival", error: error))
        }else{
            view?.show(message: "Received token. Retrieving project list")
        }
    }
    
    func didReceiveProjectsResponse(withSuccess:Bool, error:NSError?){
        if let error = error {
            view?.show(message: self.errorMessage(with: "projects retrival", error: error))
        }else{
            view?.show(message: "Retrieved projects.")
        }
    }
    
    func didSwitchTo(project project:ProjectItem){
        let message = "Retrieving the taskforms of the project:".stringByAppendingFormat(" %@", project.name)
        view?.show(message: message)
    }
    
    func didFoundZeroProjectsWithSubmissions(){
        view?.show(message: "Couldn't find any project with submissions.")
    }
    
    func didFoundZeroProjects(){
        view?.show(message: "Couldn't find any projects at all.")
    }
    
    func didReceiveProjectTaskformsResponse(withSuccess:Bool, items:[ProjectTaskformItem]?, project:ProjectItem?, error:NSError?){
        if withSuccess{
            view?.show(message: "Project taskforms are received. Switching to submissions module now.")
            if let items = items, project = project{
                self.router?.showSubmissionListModule(with: project, items: items)
            }
        }else if let error = error{
            view?.show(message: self.errorMessage(with: "project taskforms retrival", error: error))
        }
    }
}