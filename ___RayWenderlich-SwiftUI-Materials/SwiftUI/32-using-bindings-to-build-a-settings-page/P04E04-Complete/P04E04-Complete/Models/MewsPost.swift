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
///
import Combine
import SwiftUI

enum Reaction: String, CaseIterable {
  case love = "😻"
  case funny = "😹"
  case unsure = "😿"
  case shock = "🙀"
}

class MewsPost: Identifiable, ObservableObject {
  var id = UUID()
  var imageName: String
  var title: String
  var content: String
  var postDate: Date
  var isLoved: Bool
  var author: User
  var chats: [Chat]
  
  @Published var isLiked = false
  
  @Published var reaction: Reaction
  
  init(
    imageName: String,
    title: String,
    content: String,
    postDate: Date,
    author: User,
    isLoved: Bool,
    reaction: Reaction,
    chats: [Chat] = []
  ) {
    
    self.imageName = imageName
    self.title = title
    self.content = content
    self.postDate = postDate
    self.isLoved = isLoved
    self.author = author
    self.reaction = reaction
    self.chats = chats
  }
}

extension MewsPost {
  static let demoPosts = [
    MewsPost(
      imageName: "News1",
      title: "Cat gets stuck up tree!",
      content: """
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. \
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, \
        when an unknown printer took a galley of type and scrambled it to make a type \
        specimen book. It has survived not only five centuries, but also the leap into \
        electronic typesetting, remaining essentially unchanged. It was popularised in \
        the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \
        and more recently with desktop publishing software like Aldus PageMaker \
        including versions of Lorem Ipsum.
      """,
      postDate: Date(),
      author: UserType.allCases.randomElement()!.model,
      isLoved: true,
      reaction: Reaction.allCases.randomElement()!,
      chats: Chat.demoChats),
    MewsPost(
      imageName: "News2",
      title: "Another mouse bites the dust",
      content: """
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. \
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, \
        when an unknown printer took a galley of type and scrambled it to make a type \
        specimen book. It has survived not only five centuries, but also the leap into \
        electronic typesetting, remaining essentially unchanged. It was popularised in \
        the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \
        and more recently with desktop publishing software like Aldus PageMaker \
        including versions of Lorem Ipsum.
      """,
      postDate: Date(),
      author: UserType.allCases.randomElement()!.model,
      isLoved: false,
      reaction: Reaction.allCases.randomElement()!,
      chats: Chat.demoChats),
    MewsPost(
      imageName: "News3",
      title: "Is your Pet Human the real owner?",
      content: """
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. \
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, \
        when an unknown printer took a galley of type and scrambled it to make a type \
        specimen book. It has survived not only five centuries, but also the leap into \
        electronic typesetting, remaining essentially unchanged. It was popularised in \
        the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \
        and more recently with desktop publishing software like Aldus PageMaker \
        including versions of Lorem Ipsum.
      """,
      postDate: Date(),
      author: UserType.allCases.randomElement()!.model,
      isLoved: true,
      reaction: Reaction.allCases.randomElement()!),
    MewsPost(
      imageName: "News4",
      title: "Cats: Aren't we the best?",
      content: """
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. \
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, \
        when an unknown printer took a galley of type and scrambled it to make a type \
        specimen book. It has survived not only five centuries, but also the leap into \
        electronic typesetting, remaining essentially unchanged. It was popularised in \
        the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \
        and more recently with desktop publishing software like Aldus PageMaker \
        including versions of Lorem Ipsum.
      """,
      postDate: Date(),
      author: UserType.allCases.randomElement()!.model,
      isLoved: false,
      reaction: Reaction.allCases.randomElement()!,
      chats: [])
  ]
}

extension MewsPost: Equatable, Hashable {
  static func == (lhs: MewsPost, rhs: MewsPost) -> Bool {
    return lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
