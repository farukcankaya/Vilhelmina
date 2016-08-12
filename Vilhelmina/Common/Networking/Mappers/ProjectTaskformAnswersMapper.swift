//
//  ProjectTaskformAnswersMapper.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

final class ProjectTaskformAnswersMapper: ArrayResponseMapper<ProjectTaskformAnswerItem>, ResponseMapperProtocol{
    
    static func process(obj: AnyObject?) throws -> [ProjectTaskformAnswerItem] {
        return try process(obj, mapper:{json in
            guard let json = json as? NSDictionary else { return nil }
            guard let id = json["id"] as? Int else { return nil }
            guard let type = json["type"] as? String else { return nil }
            guard let questionId = json["question_id"] as? Int else { return nil }
            guard let value = json["value"] as? String else { return nil }
            
            
            return ProjectTaskformAnswerItem(id: id, type: type, questionId: questionId, value: value)
        })
    }
}