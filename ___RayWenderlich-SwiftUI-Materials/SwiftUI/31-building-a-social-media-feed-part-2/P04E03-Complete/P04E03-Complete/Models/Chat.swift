/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct Chat: Identifiable {
  var id = UUID()
  var author: UserType
  var content: String
  var chatDate: Date
}

extension Chat {
  static let demoChats = [
    Chat(author: UserType.allCases.randomElement()!, content: "Just love this purrrfect post!", chatDate: Date()),
    Chat(author: UserType.allCases.randomElement()!, content: "Seriously? What is with humans these days anyway? So hyperactive!", chatDate: Date()),
    Chat(author: UserType.allCases.randomElement()!, content: "Literally spent the entire day on the couch... time for another cat nap...", chatDate: Date()),
    Chat(author: UserType.allCases.randomElement()!, content: "Did I hear that a mouse wrote this?", chatDate: Date()),
    Chat(author: UserType.allCases.randomElement()!, content: "Hillarious!", chatDate: Date()),
    Chat(author: UserType.allCases.randomElement()!, content: "Why won't felines just tell humans this?", chatDate: Date())
  ]
}
