/// Copyright (c) 2020 Razeware LLC
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
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> QuoteEntry {
    QuoteEntry(model: Quote(), date: Date())
  }

  func getSnapshot(in context: Context, completion: @escaping (QuoteEntry) -> Void) {
    let entry = QuoteEntry(model: Quote(), date: Date())
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    var entries: [QuoteEntry] = []
    var quotes = ModelLoader.bundledQuotes

    let calendar = Calendar.current
    let currentDate = Date()

    for hourOffset in 0..<24 {
      guard let entryDate = calendar.date(byAdding: .hour, value: hourOffset, to: currentDate) else {
        continue
      }

      guard let randomQuote = quotes.randomElement() else {
        continue
      }

      if let index = quotes.firstIndex(of: randomQuote) {
        quotes.remove(at: index)
      }

      entries.append(QuoteEntry(model: randomQuote, date: entryDate))
    }

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct QuoteEntry: TimelineEntry {
  let model: Quote
  let date: Date
}

struct QuoteOfTheHourEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Image(systemName: entry.model.iconName)
          .resizable()
          .aspectRatio(nil, contentMode: .fit)
          .frame(width: 12)
          .unredacted()

        Spacer()

        Text(entry.model.createdDate, style: .date)
          .font(
            .system(
              size: 12,
              weight: .bold,
              design: .rounded
            )
          )
          .foregroundColor(.secondary)
          .multilineTextAlignment(.trailing)
      }

      Text(entry.model.content)
        .font(
          .system(
            size: 16,
            weight: .medium,
            design: .rounded
          )
        )

      Spacer()
    }
    .padding(12)
  }
}

@main
struct QuoteOfTheHour: Widget {
  let kind: String = "QuoteOfTheHour"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      QuoteOfTheHourEntryView(entry: entry)
    }
    .supportedFamilies([.systemSmall, .systemMedium])
    .configurationDisplayName("Quote Of The Hour")
    .description("Your hourly inspiration.")
  }
}
