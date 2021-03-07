// Created by nick_fox on 12/15/19.
// Copyright © 2019 Airbnb Inc. All rights reserved.

import SwiftUI

struct ContentView: View {


  @State var usedWords: [String] = []
  @State var rootWord: String = ""
  @State var newWord: String = ""

  @State var errorTitle: String = ""
  @State var errorMessage: String = ""
  @State var isShowingError: Bool = false

  var score: String {
    let scoreValue = usedWords
      .map(score)
      .reduce(0, +)
    return "\(scoreValue)"
  }

  private func score(_ word: String) -> Int {
    return word.count > 5 ? 2 : 1
  }
  var body: some View {
    NavigationView {
      VStack {
        TextField("Enter your word", text: $newWord, onCommit: addNewWord)
          .autocapitalization(.none)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()

        List(usedWords, id: \.self) {
          Image(systemName: "\($0.count).circle")
          Text($0)
        }
        Text("Score: \(score)")
      }
      .navigationBarTitle(rootWord)
      .navigationBarItems(
        leading: Button("New Game", action: startGame),
        trailing: Button("Next Word", action: setRootWord))
    }
    .onAppear(perform: startGame)
    .alert(isPresented: $isShowingError) {
      Alert(
        title: Text(errorTitle),
        message: Text(errorMessage),
        dismissButton: .default(Text("OK")))
    }
  }


  func addNewWord() {
    let answer = newWord
      .lowercased()
      .trimmingCharacters(in: .whitespacesAndNewlines)
    guard !answer.isEmpty else { return }

    guard isOriginal(answer) else {
      showError(title: "Already used", message: "Choose a new word.")
      return
    }
    guard isPossible(answer) else {
      showError(title: "Wrong letters", message: "You can only use letters in \(rootWord)")
      return
    }
    guard isReal(answer) else {
      showError(title: "Word not found", message: "This doesn't appear to be a real word")
      return
    }

    guard isMinimumLength(answer) else {
      showError(title: "Not long enough", message: "Words must be at least 3 letters")
      return
    }

    guard !isSameWord(answer) else {
      showError(title: "Nice try", message: "You can't get credit for the root word")
      return
    }
    usedWords.insert(answer, at: 0)
    newWord = ""
  }

  func showError(title: String, message: String) {
    errorTitle = title
    errorMessage = message
    isShowingError = true
  }

  func startGame() {
    usedWords = []
    setRootWord()
  }

  func setRootWord() {
    guard
      let wordFileURL = Bundle.main.url(forResource: "start", withExtension: ".txt"),
      let wordsRaw = try? String.init(contentsOf: wordFileURL)
      else { fatalError("Could not load start.txt") }
    let root = wordsRaw
      .components(separatedBy: "\n")
      .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
      .randomElement() ?? "silkworm"
    self.rootWord = root
  }

  func isOriginal(_ word: String) -> Bool {
    return !usedWords.contains(word)
  }

  func isPossible(_ word: String) -> Bool {
    var letters = rootWord
    for letter in word {
      guard let position = letters.firstIndex(of: letter) else { return false }
      letters.remove(at: position)
    }
    return true
  }

  func isReal(_ word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(
      in: word,
      range: range,
      startingAt: 0,
      wrap: false,
      language: "en")
    return misspelledRange.location == NSNotFound
  }

  func isMinimumLength(_ word: String) -> Bool {
    return word.count >= 3
  }

  func isSameWord(_ word: String) -> Bool {
    return word == rootWord
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
