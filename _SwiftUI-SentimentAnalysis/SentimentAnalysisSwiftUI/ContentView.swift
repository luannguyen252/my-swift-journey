//
//  ContentView.swift
//  SentimentAnalysisSwiftUI
//
//  Created by Martin Mitrevski on 14.07.19.
//  Copyright © 2019 Mitrevski. All rights reserved.
//

import SwiftUI
import NaturalLanguage

struct ContentView : View {
    
    @State private var text: String = ""
    private var sentiment: String {
        return performSentimentAnalysis(for: text)
    }
    private let tagger = NLTagger(tagSchemes: [.sentimentScore])

    
    var body: some View {
        VStack {
            image(for: sentiment)
                .animation(.default)
            TextField("Write something...", text: $text)
                .padding(.all)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            Text(sentiment)
                .foregroundColor(color(for: sentiment))
                .multilineTextAlignment(.center)
                .animation(.default)
        }
    }
    
    private func image(for sentiment: String) -> Image? {
        guard let value = Double(sentiment) else {
            return nil
        }
        
        if value > 0.5 {
            return Image("happy")
        } else if value >= 0 {
            return Image("positive")
        } else if value > -0.5 {
            return Image("worried")
        } else {
            return Image("crying")
        }
        
    }
    
    private func performSentimentAnalysis(for string: String) -> String {
        tagger.string = string
        let (sentiment, _) = tagger.tag(at: string.startIndex,
                                        unit: .paragraph,
                                        scheme: .sentimentScore)
        return sentiment?.rawValue ?? ""
    }
    
    private func color(for sentiment: String) -> Color {
        guard let value = Double(sentiment) else {
            return Color.black
        }
        
        if value > 0 {
            return Color.green
        } else if value < 0 {
            return Color.red
        } else {
            return Color.black
        }
        
    }
    
}
