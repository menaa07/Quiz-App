//
//  Questions.swift
//  MY QUIZ APP
//
//  Created by Mena Haitham on 12/08/2023.
//

import Foundation

enum OptionChoice {
    case one, two, three, four
}

struct Question {
    var questionTitle : String
    
    var option1: String
    var option2: String
    var option3: String
    var option4: String

    var correctOption: OptionChoice
}
