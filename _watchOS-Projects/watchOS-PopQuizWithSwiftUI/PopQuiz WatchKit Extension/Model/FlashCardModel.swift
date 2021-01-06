/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The PopQuiz flash card model which represents a list of topics that can be
 studied and questions for each topic.
*/

import Combine
import UIKit

extension Int: Identifiable {
    public var id: Int {
        self
    }
}

/// A topic that users can study.
struct Topic: Identifiable {
    let title: String
    let emoji: String
    let color: UIColor

    var cards: [Card]

    var id: String {
        title
    }
}

struct Card: Codable {
    let question: String
    let answer: String
}

class FlashCardModel: ObservableObject {
    /// An array of topics that the user is currently studying.
    @Published var topics: [Topic] = [
        Topic(title: "Math",
              emoji: "🧮",
              color: #colorLiteral(red: 150.0 / 255.0, green: 10.0 / 255.0,
                                   blue: 47.0 / 255.0, alpha: 1.0),
              cards: [
                Card(question: "Question 1", answer: "Answer"),
                Card(question: "Question 2", answer: "Answer"),
                Card(question: "Question 3", answer: "Answer"),
                Card(question: "Question 4", answer: "Answer"),
                Card(question: "Question 5", answer: "Answer"),
                Card(question: "Question 6", answer: "Answer")
            ]
        ),
        Topic(title: "Computer Science",
              emoji: "👩🏽‍💻",
              color: #colorLiteral(red: 153.0 / 255.0, green: 35.0 / 255.0,
                                   blue: 29.0 / 255.0, alpha: 1.0),
              cards: [
                Card(question: "Question 1", answer: "Answer"),
                Card(question: "Question 2", answer: "Answer"),
                Card(question: "Question 3", answer: "Answer"),
                Card(question: "Question 4", answer: "Answer"),
                Card(question: "Question 5", answer: "Answer")
            ]
        ),
        Topic(title: "Biology",
              emoji: "👩🏿‍🔬",
              color: #colorLiteral(red: 153.0 / 255.0, green: 89.0 / 255.0,
                                   blue: 0.0, alpha: 1.0),
              cards: [
                Card(question: "Question 1", answer: "Answer"),
                Card(question: "Question 2", answer: "Answer"),
                Card(question: "Question 3", answer: "Answer"),
                Card(question: "Question 4", answer: "Answer"),
                Card(question: "Question 5", answer: "Answer"),
                Card(question: "Question 6", answer: "Answer"),
                Card(question: "Question 7", answer: "Answer")
            ]
        ),
        Topic(title: "Music",
              emoji: "🎼",
              color: #colorLiteral(red: 2.0 / 255.0, green: 133.0 / 255.0,
                                   blue: 68.0 / 255.0, alpha: 1.0),
              cards: [
                Card(question: "Question 1", answer: "Answer"),
                Card(question: "Question 2", answer: "Answer"),
                Card(question: "Question 3", answer: "Answer")
            ]
        ),
        Topic(title: "Law",
              emoji: "👩🏻‍⚖️",
              color: #colorLiteral(red: 0.0, green: 147.0 / 255.0,
                                   blue: 140.0 / 255.0, alpha: 1.0),
              cards: [
                Card(question: "Question 1", answer: "Answer"),
                Card(question: "Question 2", answer: "Answer"),
                Card(question: "Question 3", answer: "Answer"),
                Card(question: "Question 4", answer: "Answer"),
                Card(question: "Question 5", answer: "Answer"),
                Card(question: "Question 6", answer: "Answer"),
                Card(question: "Question 7", answer: "Answer")
            ]
        ),
        Topic(title: "Art History",
              emoji: "🎨",
              color: #colorLiteral(red: 19.0 / 255.0, green: 89.0 / 255.0,
                                   blue: 150 / 255.0, alpha: 1.0),
              cards: [
                Card(question: "Question 1", answer: "Answer"),
                Card(question: "Question 2", answer: "Answer"),
                Card(question: "Question 3", answer: "Answer"),
                Card(question: "Question 4", answer: "Answer"),
                Card(question: "Question 5", answer: "Answer"),
                Card(question: "Question 6", answer: "Answer"),
                Card(question: "Question 7", answer: "Answer")
            ]
        )
    ]

    /// Moves the a topic to a new index.
    /// - Parameter source: The set of indexes that are being moved.
    /// - Parameter destination: The index of the destination.
    func moveTopic(from source: IndexSet, to destination: Int) {
        guard let index = source.first else {
            return
        }
        let element = topics.remove(at: index)
        topics.insert(element, at: destination)
    }

    /// Remove a topic at the particular index.
    /// - Parameter indices: The set of indexes to be removed.
    func deleteTopic(at indices: IndexSet) {
        indices.forEach { topics.remove(at: $0) }
    }
}

extension Card {
    /// A sample card used in the preview.
    static let previewCard = Card(question: "6 × 7", answer: "42")
}

extension Topic {
    /// A sample topic used in the preview.
    static let previewTopic = Topic(title: "Math", emoji: "🧮",
        color: .white, cards: [Card.previewCard, Card.previewCard, Card.previewCard])
}
