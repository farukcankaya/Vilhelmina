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
    
    private var rootNavigationController: UINavigationController?
    private let bootstrapNavigationControllerIdentifier = "BootstrapNavigationController"
    
    private func mainStoryboard() -> UIStoryboard{
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    private func view(withIdentifier identifier: String) -> UIViewController?{
        return self.mainStoryboard().instantiateViewControllerWithIdentifier(identifier)
    }
    
    private func setupBootstrapView(with view:BootstrapView) -> BootstrapView{
        let dataManager = BootstrapDataManager()
        let interactor = BootstrapInteractor(withDataManager: dataManager)
        let presenter = BootstrapPresenter(withView: view, interactor: interactor, router: self)
        
        view.presenter = presenter
        interactor.presenter = presenter
        dataManager.interactor = interactor
        
        return view
    }
    
    private func setupSubmissionListView(with view:SubmissionListView, items:[ProjectTaskformItem]) -> SubmissionListView{
        let dataManager = SubmissionListDataManager(with: items)
        let interactor = SubmissionListInteractor(withDataManager: dataManager)
        let presenter = SubmissionListPresenter(withView: view, interactor: interactor, router: self)
        
        view.presenter = presenter
        interactor.presenter = presenter
        dataManager.interactor = interactor
        
        return view
    }
    
    func installRootView(into window: UIWindow){
        if let bootstrapNavigationController = self.view(withIdentifier: bootstrapNavigationControllerIdentifier) as? UINavigationController{
            self.rootNavigationController = bootstrapNavigationController
            if var bootstrapView = bootstrapNavigationController.viewControllers.first as? BootstrapView{
                bootstrapView = self.setupBootstrapView(with: bootstrapView)
                dispatch_async(dispatch_get_main_queue(), { 
                    window.rootViewController = bootstrapNavigationController
                })
            }
        }
    }
    
    func showSubmissionListModule(with project:ProjectItem, items:[ProjectTaskformItem]){
        if var submissionListView = self.view(withIdentifier: String(SubmissionListView)) as? SubmissionListView{
            submissionListView = self.setupSubmissionListView(with: submissionListView, items: items)
            submissionListView.chosenProject = project
            dispatch_async(dispatch_get_main_queue(), { 
                self.rootNavigationController?.presentViewController(submissionListView, animated: true, completion: nil)
            })
        }
    }
    
    func bind(view: SubmissionListView, to taskformsList:ProjectTaskformsListView, items: [ProjectTaskformItem]){
        taskformsList.projectTaskforms = items
        taskformsList.modalPresentationStyle = .Popover
        taskformsList.delegate = view
        if let popoverPresentationController = taskformsList.popoverPresentationController{
            popoverPresentationController.delegate = view
        }
    }
}