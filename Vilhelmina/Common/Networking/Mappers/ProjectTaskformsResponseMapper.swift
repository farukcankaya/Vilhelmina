//
//  ProjectTaskformsResponseMapper.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

final class ProjectTaskformsResponseMapper: ArrayResponseMapper<ProjectTaskformItem>, ResponseMapperProtocol{
    
    static func process(obj: AnyObject?) throws -> [ProjectTaskformItem] {
        return try process(obj, mapper:{json in
            guard let json = json as? NSDictionary else { return nil }
            guard let id = json["id"] as? Int else { return nil }
            guard let title = json["title"] as? String else { return nil }
            
            return ProjectTaskformItem(id: id, title: title)
        })
    }
}