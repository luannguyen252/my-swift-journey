//
//  Question.swift
//  Quiz
//
//  Created by Balaji on 28/11/20.
//

import SwiftUI
import FirebaseFirestoreSwift

// COdable Model...

struct Question: Identifiable,Codable {
    
    // it will fetch doc ID...
    @DocumentID var id: String?
    var question : String?
    var optionA: String?
    var optionB: String?
    var optionC: String?
    var answer: String?
    
    // for checking...
    var isSubmitted = false
    var completed = false
    
    // declare the coding keys with respect to firebase firestore Key....
    
    enum CodingKeys: String,CodingKey {
        case question
        case optionA = "a"
        case optionB = "b"
        case optionC = "c"
        case answer
    }
}
