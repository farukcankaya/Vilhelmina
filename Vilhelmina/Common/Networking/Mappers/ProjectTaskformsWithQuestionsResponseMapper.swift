//
//  ProjectTaskformsWithQuestionsResponseMapper.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

final class ProjectTaskformsWithQuestionsResponseMapper: ResponseMapper<ProjectTaskformItem>, ResponseMapperProtocol {
    
    static func process(obj: AnyObject?) throws -> ProjectTaskformItem {
        return try process(obj, parse: { json in
            
            guard let id = json["id"] as? Int else { return nil }
            guard let title = json["title"] as? String else { return nil }
            
            var questions: [ProjectTaskformQuestionItem]?
            
            if let questionsKey = json["questions"] {
                do{
                    questions = try ProjectTaskformQuestionsMapper.process(questionsKey)
                }catch{
                    print(error)
                }
            }
            
            return ProjectTaskformItem(id: id, title: title, questions: questions)
        })
    }
}
