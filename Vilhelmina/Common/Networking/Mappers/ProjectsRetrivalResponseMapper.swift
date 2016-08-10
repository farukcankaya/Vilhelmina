//
//  ProjectsRetrivalResponseMapper.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

final class ProjectsRetrivalResponseMapper: ArrayResponseMapper<ProjectItem>, ResponseMapperProtocol{
    
    static func process(obj: AnyObject?) throws -> [ProjectItem] {
        return try process(obj, mapper:{json in
            guard let json = json as? NSDictionary else { return nil }
            guard let id = json["id"] as? Int else { return nil }
            guard let name = json["name"] as? String else { return nil }
            guard let submissionsCount = json["submissions_count"] as? Int else { return nil }
            
            return ProjectItem(id: id, name:name, submissionsCount: submissionsCount)
        })
    }
}