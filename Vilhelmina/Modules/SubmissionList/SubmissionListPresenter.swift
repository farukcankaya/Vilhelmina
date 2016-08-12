//
//  SubmissionListPresenter.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import UIKit

protocol SubmissionListPresenterProtocol{
    var interactor: SubmissionListInteractor? { get set }
    weak var view: SubmissionListView? { get set }
    
    func didBeginTaskformsListSegue(destinationView: ProjectTaskformsListView)
    func getTaskformQuestions(projectId:Int, taskformId:Int)
    func getTaskformSubmissions(projectId:Int, taskformId: Int)
}

class SubmissionListPresenter: SubmissionListPresenterProtocol, Routable{
    var router: RootWireframe?
    var interactor: SubmissionListInteractor?
    weak var view: SubmissionListView?
    
    init(withView view:SubmissionListView, interactor:SubmissionListInteractor, router:RootWireframe){
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
    func didBeginTaskformsListSegue(destinationView: ProjectTaskformsListView) {
        if let view = view, interactor = interactor{
            router?.bind(view, to: destinationView, items: interactor.getTaskforms())
        }
    }
    
    func getTaskformQuestions(projectId:Int, taskformId:Int){
        interactor?.getTaskformQuestions(projectId, taskformId: taskformId)
    }
    
    func getTaskformSubmissions(projectId:Int, taskformId: Int){
        interactor?.getTaskformSubmissions(projectId, taskformId: taskformId)
    }
}

extension SubmissionListPresenter: SubmissionListInteractorOutputProtocol{
    func didReceiveTaskformQuestionsResponse(withSuccess:Bool, taskform:ProjectTaskformItem?, error:NSError?){
        if withSuccess{
            if let count = taskform?.questions?.count{
                view?.show(summary: "Found \(count) questions.")
            }
        }else{
            view?.show(summary: "An error occured. (\(error?.localizedDescription))")
        }
    }
    
    func didReceiveTaskformSubmissionsResponse(withSuccess:Bool, submissions:[ProjectTaskformSubmissionItem]?, error:NSError?){
        if withSuccess{
            if let count = submissions?.count{
                view?.show(summary: "Found \(count) submissions.")
            }
        }else{
            view?.show(summary: "An error occured. (\(error?.localizedDescription))")
        }
    }
}