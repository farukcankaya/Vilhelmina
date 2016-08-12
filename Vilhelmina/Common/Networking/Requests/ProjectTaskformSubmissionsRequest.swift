//
//  ProjectTaskformSubmissionsRequest.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

final class ProjectTaskformSubmissionsRequest: BackendAPIRequest{
    
    private let projectId: Int
    private let taskformId: Int
    
    init(projectId: Int, taskformId: Int){
        self.projectId = projectId
        self.taskformId = taskformId
    }
    
    var endpoint: String {
        return "/projects/\(self.projectId)/task_forms/\(self.taskformId)/submissions"
    }
    
    var method: NetworkService.Method {
        return .GET
    }
    
    var parameters: [String : AnyObject]? {
        return nil
    }
    
    var headers: [String : String]? {
        return defaultJSONHeaders()
    }
}