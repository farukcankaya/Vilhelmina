//
//  SubmissionListDataManager.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

protocol SubmissionListDataManagerInputProtocol{
    var interactor: SubmissionListInteractor? { get set }
    var taskforms: [ProjectTaskformItem] { get }
    var taskformWithQuestions: ProjectTaskformItem? { get set }
    var taskformWithSubmissions: [ProjectTaskformSubmissionItem]? { get set }
    
    func getTaskformQuestions(projectId:Int, taskformId:Int)
    func getTaskformSubmissions(projectId:Int, taskformId: Int)
}

protocol SubmissionListDataManagerOutputProtocol{
    func didReceiveTaskformQuestionsResponse(withSuccess:Bool, taskform:ProjectTaskformItem?, error:NSError?)
    func didReceiveTaskformSubmissionsResponse(withSuccess:Bool, submissions:[ProjectTaskformSubmissionItem]?, error:NSError?)
}

class SubmissionListDataManager: SubmissionListDataManagerInputProtocol{
    var interactor: SubmissionListInteractor?
    var taskforms: [ProjectTaskformItem]
    
    var taskformWithQuestions: ProjectTaskformItem?
    var taskformWithSubmissions: [ProjectTaskformSubmissionItem]?
    
    init(with taskforms:[ProjectTaskformItem]){
        self.taskforms = taskforms
    }
    
    func getTaskformQuestions(projectId:Int, taskformId:Int){
        let projectTaskformsOperation = ProjectTaskformsWithQuestionsOperation(projectId: projectId, taskformId: taskformId)
        
        projectTaskformsOperation.success = { item in
            print(item)
            self.interactor?.didReceiveTaskformQuestionsResponse(true, taskform: item, error: nil)
        }
        
        projectTaskformsOperation.failure = { error in
            print(error)
            self.interactor?.didReceiveTaskformQuestionsResponse(false, taskform: nil, error: error)
        }
        
        NetworkQueue.shared.addOperation(projectTaskformsOperation)
    }
    
    func getTaskformSubmissions(projectId:Int, taskformId:Int){
        let projectTaskformSubmissionsOperation = ProjectTaskformSubmissionsOperation(projectId: projectId, taskformId: taskformId)
        
        projectTaskformSubmissionsOperation.success = { items in
            print(items)
            self.interactor?.didReceiveTaskformSubmissionsResponse(true, submissions: items, error: nil)
        }
        
        projectTaskformSubmissionsOperation.failure = { error in
            print(error)
            self.interactor?.didReceiveTaskformSubmissionsResponse(false, submissions: nil, error: error)
        }
        
        NetworkQueue.shared.addOperation(projectTaskformSubmissionsOperation)
    }
}