//
//  ProjectTaskformQuestionsMapper.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

final class ProjectTaskformQuestionsMapper: ArrayResponseMapper<ProjectTaskformQuestionItem>, ResponseMapperProtocol{
    
    static func process(obj: AnyObject?) throws -> [ProjectTaskformQuestionItem] {
        return try process(obj, mapper:{json in
            guard let json = json as? NSDictionary else { return nil }
            guard let id = json["id"] as? Int else { return nil }
            guard let label = json["label"] as? String else { return nil }
            guard let questionTypeString = json["question_type"] as? String else { return nil }
            guard let questionType = ProjectTaskformQuestionType(rawValue: questionTypeString) else { return nil }
            
            return ProjectTaskformQuestionItem(id: id, label: label, type: questionType)
        })
    }
}