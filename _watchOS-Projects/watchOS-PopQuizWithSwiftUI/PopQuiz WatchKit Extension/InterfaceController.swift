/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The main interface controller for the PopQuiz application.
*/

import SwiftUI

class InterfaceController: WKHostingController<TopicList> {

    override var body: TopicList {
        // Show the topic list using our Flash Card model.
        TopicList(model: FlashCardModel())
    }

}
