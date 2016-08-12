//
//  ProjectTaskformSubmissionItem.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public struct ProjectTaskformSubmissionItem: ParsedItem{
    public let id: Int
    public let answers: [ProjectTaskformAnswerItem]?
}