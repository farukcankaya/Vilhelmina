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
    var taskformsWithQuestions: [ProjectTaskformItem]? { get set }
    var taskformsWithAnswers: [ProjectTaskformItem]? { get set }
    
    func getTaskformQuestions(projectId:Int, taskformId:Int)
    func getTaskformSubmissions(projectId:Int, taskformId: Int)
}

protocol SubmissionListDataManagerOutputProtocol{
    
}

class SubmissionListDataManager: SubmissionListDataManagerInputProtocol{
    var interactor: SubmissionListInteractor?
    var taskforms: [ProjectTaskformItem]
    
    var taskformsWithQuestions: [ProjectTaskformItem]?
    var taskformsWithAnswers: [ProjectTaskformItem]?
    
    init(with taskforms:[ProjectTaskformItem]){
        self.taskforms = taskforms
    }
    
    func getTaskformQuestions(projectId:Int, taskformId:Int){
        let projectTaskformsOperation = ProjectTaskformsWithQuestionsOperation(projectId: projectId, taskformId: taskformId)
        
        projectTaskformsOperation.success = { item in
            print(item)
        }
        
        projectTaskformsOperation.failure = { error in
            print(error)
        }
        
        NetworkQueue.shared.addOperation(projectTaskformsOperation)
    }
    
    func getTaskformSubmissions(projectId:Int, taskformId:Int){
        let projectTaskformSubmissionsOperation = ProjectTaskformSubmissionsOperation(projectId: projectId, taskformId: taskformId)
        
        projectTaskformSubmissionsOperation.success = { item in
            print(item)
        }
        
        projectTaskformSubmissionsOperation.failure = { error in
            print(error)
        }
        
        NetworkQueue.shared.addOperation(projectTaskformSubmissionsOperation)
    }
}