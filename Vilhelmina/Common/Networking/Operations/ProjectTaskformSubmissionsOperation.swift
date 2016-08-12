//
//  ProjectTaskformSubmissionsOperation.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public class ProjectTaskformSubmissionsOperation: ServiceOperation{
    
    private let request: ProjectTaskformSubmissionsRequest
    
    public var success: ([ProjectTaskformSubmissionItem] -> Void)?
    public var failure: (NSError -> Void)?
    
    public init(projectId:Int, taskformId:Int){
        request = ProjectTaskformSubmissionsRequest(projectId: projectId, taskformId: taskformId)
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
            
            let projectTaskformSubmissions: [ProjectTaskformSubmissionItem] = try ProjectTaskformSubmissionsMapper.process(response["data"])
            
            self.success?(projectTaskformSubmissions)
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