/// Copyright (c) 2021 Razeware LLC
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

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    .init(date: .init())
  }

  func getSnapshot(
    in context: Context,
    completion: @escaping (SimpleEntry) -> Void
  ) {
    completion(
      .init(date: .init())
    )
  }

  func getTimeline(
    in context: Context,
    completion: @escaping (Timeline<Entry>) -> Void
  ) {
    completion(
      Timeline(
        entries: [.init(date: .init())],
        policy: .atEnd
      )
    )
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
}

struct WeatherChartWidgetEntryView: View {
  let entry: Provider.Entry
  @Environment(\.widgetFamily) var widgetFamily

  var body: some View {
    TemperatureChart(
      measurements: [WeatherStation]()[0].measurements,
      renderDegrees: widgetFamily == .systemLarge,
      renderMonthNames: false
    )
  }
}

@main
struct WeatherChartWidget: Widget {
  let kind: String = "WeatherChartWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(
      kind: kind,
      provider: Provider()
    ) { entry in
      WeatherChartWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Temperature Chart")
    .description("All the year's temperatures for the station.")
    .supportedFamilies([.systemMedium, .systemLarge])
  }
}

struct WeatherChartWidget_Previews: PreviewProvider {
  static var previews: some View {
    let view = WeatherChartWidgetEntryView(entry: .init(date: .init()))
    view.previewContext(WidgetPreviewContext(family: .systemMedium))
    view.previewContext(WidgetPreviewContext(family: .systemLarge))
  }
}
