//
//  ContentView.swift
//  PurchaseButton
//
//  Created by Pablo Blanco González on 08/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var payTimer: Timer?
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            PurchaseButton(isDownloaded: false,
                           isDone: false,
                           preparingDownloadAction: { result in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                result(.success(true))
                            }
                           },
                           downloadAction: { result in
                            var downloadProgress = 0.0
                            payTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
                                withAnimation {
                                    downloadProgress += 0.1
                                    result(.success(downloadProgress))
                                }
                            }
                           },
                           cancelDownloadAction: {
                            payTimer?.invalidate()
                            payTimer = nil
                           }, downloadedAction: {
                            // OPEN APP
                            
                           })
            Spacer()
        }
        .padding(.all, 100)
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
