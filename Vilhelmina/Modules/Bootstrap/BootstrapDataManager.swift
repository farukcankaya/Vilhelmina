//
//  IntroDataManager.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

protocol BootstrapDataManagerInputProtocol{
    var interactor: BootstrapInteractor? { get set }
    
    func login()
}

protocol BootstrapDataManagerOutputProtocol{
    func didReceiveLoginResponse(withSuccess:Bool, error:NSError?)
    func didReceiveProjectsResponse(withSuccess:Bool, items:[ProjectItem]?, error:NSError?)
    func didReceiveProjectTaskformsResponse(withSuccess:Bool, taskforms:[ProjectTaskformItem]?, project:ProjectItem?, error:NSError?)
}

class BootstrapDataManager: BootstrapDataManagerInputProtocol{
    var interactor: BootstrapInteractor?
    
    func login(){
        let signingInOperation = SignInOperation(email: "foo@bar", password: "123456")
        
        signingInOperation.success = { item in
            self.interactor?.didReceiveLoginResponse(true, error: nil)
        }
        
        signingInOperation.failure = { error in
            self.interactor?.didReceiveLoginResponse(false, error: error)
        }
        
        NetworkQueue.shared.addOperation(signingInOperation)
    }
    
    func getProjects(){
        let projectsRetrivalOperation = ProjectsRetrivalOperation()
        
        projectsRetrivalOperation.success = { items in
            print(items)
            self.interactor?.didReceiveProjectsResponse(true, items: items, error: nil)
        }
        
        projectsRetrivalOperation.failure = { error in
            print(error.localizedDescription)
            self.interactor?.didReceiveProjectsResponse(false, items: nil, error: error)
        }
        
        NetworkQueue.shared.addOperation(projectsRetrivalOperation)
    }
    
    func getTaskforms(of project: ProjectItem){
        let projectTaskformsOperation = ProjectTaskformsOperation(projectId: project.id)
        
        projectTaskformsOperation.success = { taskforms in
            print(taskforms)
            self.interactor?.didReceiveProjectTaskformsResponse(true, taskforms: taskforms, project: project, error: nil)
        }
        
        projectTaskformsOperation.failure = { error in
            print(error.localizedDescription)
            self.interactor?.didReceiveProjectTaskformsResponse(false, taskforms: nil, project: project, error: error)
        }
        
        NetworkQueue.shared.addOperation(projectTaskformsOperation)
    }
}