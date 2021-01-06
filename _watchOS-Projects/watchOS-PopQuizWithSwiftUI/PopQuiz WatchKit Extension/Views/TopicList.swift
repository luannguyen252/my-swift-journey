/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A list that shows various topics to study.
*/

import SwiftUI
import Combine

struct TopicList: View {
    // Observe changes to the flash card model and update the topic list accordingly.
    @ObservedObject var model: FlashCardModel

    var body: some View {
        List {
            ForEach(model.topics) { topic in
                NavigationLink(destination: CardList(topic: topic)) {
                    TopicCell(topic: topic)
                        .frame(height: 100.0)
                }
                .listRowPlatterColor(Color(topic.color))
            }
            .onMove { self.model.moveTopic(from: $0, to: $1) }
            .onDelete { self.model.deleteTopic(at: $0) }
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Pop Quiz!"))
    }
}

struct TopicCell: View {
    var topic: Topic

    var body: some View {
        HStack {
            Text(topic.emoji)
                .font(.title)
            VStack(alignment: .leading) {
                Text(topic.title)
                    .font(.system(.headline, design: .rounded))
                Text("\(topic.cards.count) cards")
            }
        }
    }
}

struct TopicList_Previews: PreviewProvider {
    static var previews: some View {
        TopicList(model: FlashCardModel())
    }
}
