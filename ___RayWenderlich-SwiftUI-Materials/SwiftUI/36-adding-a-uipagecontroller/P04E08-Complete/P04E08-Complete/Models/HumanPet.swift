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

struct HumanPet {
  var image: Image
  var name: String
  var favoriteHobby: String
  var moods: [PetStatusModel]
}

// HumanPet demo data
extension HumanPet {
  static let demoData = [
    HumanPet(
      image: Image("Ray", label: Text("Profile Image")),
      name: "Ray",
      favoriteHobby: "Likes mountain climbing",
      moods: [
        PetStatusModel(mood: .happy, date: Date()),
        PetStatusModel(mood: .uncatty, date: Date(timeIntervalSinceReferenceDate: 129309)),
        PetStatusModel(mood: .normal, date: Date(timeIntervalSinceReferenceDate: 1293039)),
        PetStatusModel(mood: .uncatty, date: Date(timeIntervalSinceReferenceDate: 1293049)),
        PetStatusModel(mood: .normal, date: Date(timeIntervalSinceReferenceDate: 1239309))
    ]),
    HumanPet(
      image: Image("Catie"),
      name: "Catie",
      favoriteHobby: "Loves iOS",
      moods: []),
    HumanPet(
      image: Image("Laurie"),
      name: "Laurie",
      favoriteHobby: "Likes learning",
      moods: []),
    HumanPet(
      image: Image("Jessy"),
      name: "Jessy",
      favoriteHobby: "Likes creating content",
      moods: [
        PetStatusModel(mood: .happy, date: Date()),
        PetStatusModel(mood: .happy, date: Date(timeIntervalSinceReferenceDate: 129309)),
        PetStatusModel(mood: .normal, date: Date(timeIntervalSinceReferenceDate: 1293039)),
        PetStatusModel(mood: .happy, date: Date(timeIntervalSinceReferenceDate: 1293049)),
        PetStatusModel(mood: .normal, date: Date(timeIntervalSinceReferenceDate: 1239309))
    ]),
    HumanPet(
      image: Image("Antonio"),
      name: "Antonio",
      favoriteHobby: "Likes coding",
      moods: []),
    HumanPet(
      image: Image("Profile"),
      name: "Marin",
      favoriteHobby: "Likes writing",
      moods: []),
    HumanPet(
      image: Image("Profile"),
      name: "Katie",
      favoriteHobby: "Likes reviewing",
      moods: [
        PetStatusModel(mood: .uncatty, date: Date()),
        PetStatusModel(mood: .uncatty, date: Date(timeIntervalSinceReferenceDate: 129309)),
        PetStatusModel(mood: .uncatty, date: Date(timeIntervalSinceReferenceDate: 1293039)),
        PetStatusModel(mood: .normal, date: Date(timeIntervalSinceReferenceDate: 1293049)),
        PetStatusModel(mood: .uncatty, date: Date(timeIntervalSinceReferenceDate: 1239309))
    ])
  ]
}
