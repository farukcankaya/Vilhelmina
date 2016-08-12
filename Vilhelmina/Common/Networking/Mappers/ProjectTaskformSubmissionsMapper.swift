//
//  ProjectTaskformsWithAnswersResponseMapper.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

final class ProjectTaskformSubmissionsMapper: ArrayResponseMapper<ProjectTaskformSubmissionItem>, ResponseMapperProtocol {
    
    static func process(obj: AnyObject?) throws -> [ProjectTaskformSubmissionItem] {
        return try process(obj, mapper:{json in
            guard let json = json as? NSDictionary else { return nil }
            guard let id = json["id"] as? Int else { return nil }
            
            var answers: [ProjectTaskformAnswerItem]?
            
            if let answersKey = json["answers"] {
                do{
                    answers = try ProjectTaskformAnswersMapper.process(answersKey)
                }catch{
                    print(error)
                }
            }
            
            return ProjectTaskformSubmissionItem(id: id, answers: answers)
        })
    }
}
