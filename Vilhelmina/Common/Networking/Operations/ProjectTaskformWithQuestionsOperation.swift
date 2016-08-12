//
//  ProjectTaskformWithQuestions.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public class ProjectTaskformsWithQuestionsOperation: ServiceOperation{
    
    private let request: ProjectTaskformQuestionsRequest
    
    public var success: (ProjectTaskformItem -> Void)?
    public var failure: (NSError -> Void)?
    
    public init(projectId:Int, taskformId:Int){
        request = ProjectTaskformQuestionsRequest(projectId: projectId, taskformId: taskformId)
        super.init()
    }
    
    public override func start() {
        super.start()
        service.request(request, success: handleSuccess, failure: handleFailure)
    }
    
    private func handleSuccess(response: AnyObject?) {
        do{
            guard let response = response as? NSDictionary else {
                handleFailure(NSError.cannotParseResponse())
                return
            }
            
            let projectTaskforms: ProjectTaskformItem = try ProjectTaskformsWithQuestionsResponseMapper.process(response["data"])
            
            self.success?(projectTaskforms)
            self.finish()
        }catch{
            print(error)
            handleFailure(NSError.cannotParseResponse())
        }
    }
    
    private func handleFailure(error: NSError) {
        self.failure?(error)
        self.finish()
    }
}