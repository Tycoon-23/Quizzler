//
//  Question.swift
//  Quizzler
//
//  Created by Aditya Virbhadra Vyavahare on 08/08/22.
//

import Foundation

struct Question {
    var text: String
    var answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
