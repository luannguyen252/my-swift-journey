//
//  First_Widget.swift
//  First Widget
//
//  Created by Luan Nguyen on 13/12/2020.
//

import WidgetKit
import SwiftUI

// MARK: - NETWORK MANAGER
class NetworkManager {
    func getWeatherData(completion: @escaping (SimpleEntry.WidgetData?) -> Void) {
        guard let url = URL(string: "https://api.blockchain.com/v3/exchange/tickers/BTC-USD") else {
            return completion(nil) }
            
            URLSession.shared.dataTask(with: url) { d, res, err in
                var result: SimpleEntry.WidgetData?
                
                if let data = d,
                   let response = res as? HTTPURLResponse,
                   response.statusCode == 200 {
                    do {
                        result = try JSONDecoder().decode(SimpleEntry.WidgetData.self, from: data)
                    } catch {
                        print(error)
                    }
                }
                
                return completion(result)
            }
            .resume()
    }
}

struct Provider: TimelineProvider {
    // MARK: - PROPERTIES
    let networkManager = NetworkManager()
    
    // MARK: - PLACEHOLDER
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), data: .previewData, error: false)
    }

    // MARK: - SNAPSHOT
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        // Call network manager
        networkManager.getWeatherData { data in
            let entry = SimpleEntry(date: Date(), data: data ?? .error, error: data == nil)
            completion(entry)
        }
    }

    // MARK: - TIMELINE
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        // Call network manager
        networkManager.getWeatherData { data in
            let timeline = Timeline(
                entries: [SimpleEntry(date: Date(), data: data ?? .error, error: data == nil)],
                policy: .after(
                    Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
                )
            )
            completion(timeline)
        }
        
//        let timeline = Timeline(
//            entries: [SimpleEntry(date: Date(), data: .previewData, error: false)],
//            policy: .after(
//                Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
//            )
//        )
//        completion(timeline)
    }
}

// MARK: - SIMPLE ENTRY
struct SimpleEntry: TimelineEntry {
    // MARK: - PROPERTIES
    let date: Date
    var data: WidgetData
    var error: Bool
    
    enum DifferenceMode: String {
        case up = "up",
             down = "down",
             error = "error"
    }
    
    var diffMode: DifferenceMode {
        if error || data.difference == 0.0 {
            return .error
        } else if data.difference > 0.0 {
            return .up
        } else {
            return .down
        }
    }
    
    // MARK: - WIDGET DATA
    struct WidgetData: Decodable {
        let price_24h: Double
        let volume_24h: Double
        let last_trade_price: Double
        var difference: Double {
            price_24h - last_trade_price
        }
        
        // MARK: - WIDGET DATA PREVIEW
        static let previewData = WidgetData (
            price_24h: 123,
            volume_24h: 456,
            last_trade_price: 789
        )
        
        static let error = WidgetData (
            price_24h: 0,
            volume_24h: 0,
            last_trade_price: 0
        )
    }
}

// MARK: - ENTRY VIEW
struct First_WidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    @Environment(\.colorScheme) var scheme
    
    var entry: Provider.Entry

    // MARK: - BODY WIDGET
    var body: some View {
        ZStack {
            // Background
            Image("bg")
                .resizable()
                .unredacted()
                .scaledToFill()
            
            // Content
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Spacer()
                    Header
                    Spacer()
                    Pricing
                    Spacer()
                    Spacer()
                    if family == .systemLarge {
                        Volume
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
    
    // MARK: - HEADER VIEW
    var Header: some View {
        Group {
            Text("iCoin 😎")
                .bold()
                .font(family == .systemLarge ? .system(size: 40) : .title)
                .minimumScaleFactor(0.5)
                .foregroundColor(scheme == .dark ? .purple : .black)
            Text("Bitcoin")
                .font(family == .systemLarge ? .title : .headline)
                .padding(.top, family == .systemLarge ? -15 : 0)
                .foregroundColor(scheme == .dark ? .white : Color(.black).opacity(0.6))
        }
    }
    
    // MARK: - PRICING VIEW
    var Pricing: some View {
        Group {
            if family == .systemMedium {
                HStack (alignment: .firstTextBaseline) {
                    Price
                    Difference
                }
            } else {
                Price
                Difference
            }
        }
    }
    
    // MARK: - PRICE VIEW
    var Price: some View {
        Text(entry.error ? "---" : "\(entry.diffMode == .up ? "+" : "")\(String(format: "%.2f", entry.data.price_24h))")
            .font(family == .systemSmall ? .body : .system(size: CGFloat(family.rawValue * 25 + 12)))
            .bold()
            .foregroundColor(scheme == .dark ? .white : .black)
    }
    
    // MARK: - DIFFERENCE VIEW
    var Difference: some View {
        Text(entry.error ? "---" : "\(entry.diffMode == .up ? "+" : "")\(String(format: "%.2f", entry.data.difference))")
            .font(family == .systemSmall ? .footnote : .title2)
            .bold()
            .foregroundColor(.red)
    }
    
    // MARK: - VOLUME VIEW
    var Volume: some View {
        Text("VOLUME: \(entry.error ? "---" :  "")\(String(format: "%.2f", entry.data.price_24h))")
            .font(.title2)
            .bold()
            .foregroundColor(scheme == .dark ? .purple : .black)
    }
}

@main
struct First_Widget: Widget {
    // MARK: - PROPERTIES
    let kind: String = "First_Widget"

    // MARK: - bODY
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            First_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("iCoin 😎")
        .description("This is my first widget I made for my first application.")
    }
}

// MARK: - PREVIEW
struct First_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // MARK: - SMALL WIDGET
            First_WidgetEntryView(entry: SimpleEntry(date: Date(), data: .previewData, error: false))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            // MARK: - MEDIUM WIDGET
            First_WidgetEntryView(entry: SimpleEntry(date: Date(), data: .previewData, error: false))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            // MARK: - LARGE WIDGET
            First_WidgetEntryView(entry: SimpleEntry(date: Date(), data: .previewData, error: false))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
        .environment(\.colorScheme, .dark)
        // .redacted(reason: .placeholder)
    }
}
