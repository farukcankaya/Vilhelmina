//
//  ProjectTaskformAnswerItem.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public struct ProjectTaskformAnswerItem: ParsedItem{
    public let id: Int
    public let type: String
    public let questionId: Int
    public let value: String
}