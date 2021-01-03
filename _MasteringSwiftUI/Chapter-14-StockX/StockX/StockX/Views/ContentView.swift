//
//  ContentView.swift
//  StockX
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
    let stockSymbol: String
    @ObservedObject var downloadManager: DownloadManager
    @State var timeFrameChoice = 0

    var body: some View {
        VStack {
            TimeFrameBar(timeFrameChoice: $timeFrameChoice)
            if downloadManager.dataFetched {
                Header(stockData: timeFrameChoice == 0 ? downloadManager.dailyEntries : downloadManager.weeklyEntries)
                Chart(dataSet: timeFrameChoice == 0 ? downloadManager.dailyEntries : downloadManager.weeklyEntries)
                    .frame(height: 300)
            }
            
            Spacer()
            
            TransactionButtons()
            
            Spacer()
        }
        .navigationTitle(stockSymbol)
    }
}

struct Header: View {
    let stockData: [DataEntry]
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("$" + String(format: "%.2f", stockData.last?.close ?? 0))
                .font(.custom("Avenir", size: 45))
            
            Text(String(format: "%.2f", getPercentageChange(stockData: stockData)) + "%")
                .font(.custom("Avenir", size: 18))
                .fontWeight(.medium)
                .foregroundColor(getPercentageChange(stockData: stockData) < 0 ? .red : .blue)
        }
        .padding()
        .padding(.top, 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(stockSymbol: "AAPL", downloadManager: DownloadManager(stockSymbol: "AAPL"))
    }
}

struct TransactionButtons: View {
    var body: some View {
        HStack {
            Text("Sell Shares")
                .font(.custom("Avenir", size: 16))
                .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                .padding(20)
                .background(Color(red: 0.25, green: 0.27, blue: 0.3))
            
            Text("Buy Shares")
                .font(.custom("Avenir", size: 16))
                .foregroundColor(.white)
                .padding(20)
                .background(Color.blue)
        }
        .background(Color.blue)
        .cornerRadius(16)
    }
}

struct TimeFrameBar: View {
    @Binding var timeFrameChoice: Int
    
    var body: some View {
        HStack {
            Text("Day")
                .font(.custom("Avenir", size: 18))
                .fontWeight(timeFrameChoice == 0 ? .medium : .none)
                .foregroundColor(timeFrameChoice == 0 ? .blue : .gray)
                .onTapGesture(perform: { self.timeFrameChoice = 0 })
            
            Text("Week")
                .font(.custom("Avenir", size: 18))
                .fontWeight(timeFrameChoice == 1 ? .medium : .none)
                .foregroundColor(timeFrameChoice == 1 ? .blue : .gray)
                .onTapGesture(perform: { self.timeFrameChoice = 1 })
            
            Spacer()
        }
        .padding()
    }
}
