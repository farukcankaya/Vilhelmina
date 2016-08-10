//
//  ProjectsRetrivalRequest.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

final class ProjectsRetrivalRequest: BackendAPIRequest{
    
    init(){}
    
    var endpoint: String {
        return "/projects"
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