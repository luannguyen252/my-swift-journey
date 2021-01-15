//
//  Sentence.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul on 9/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import SwiftUI

class Sentence: ObservableObject {
  @Published var sentences = ["I am currently working on a SwiftUI app implementing Form view",
                   "Definitely fells like fall 🍁🍂🍃",
                   "My son's birthday is coming up....shhhh 🤫 I have a really cool gift for him"
  ]
}
