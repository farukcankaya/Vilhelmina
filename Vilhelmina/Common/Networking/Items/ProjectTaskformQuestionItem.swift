//
//  ProjectTaskformQuestion.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 12/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public enum ProjectTaskformQuestionType: String{
    case Checkbox = "checkbox"
    case Dropdown = "dropdown"
    case Number = "number"
    case Textarea = "textarea"
    case Radio = "radio"
    case Text = "text"
    case ImageUpload = "image_upload"
    case MultipleImage = "multiple_image_upload"
    case ImageCapture = "image_capture"
    case MultipleImageCapture = "multiple_image_capture"
    case LocationStamp = "location_stamp"
    case LocationMap = "location_map"
    case VoiceRecord = "voice_record"
}

public struct ProjectTaskformQuestionItem: ParsedItem{
    public let id: Int
    public let label: String
    public let type: ProjectTaskformQuestionType
}