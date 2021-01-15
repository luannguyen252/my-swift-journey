//
//  ContentView.swift
//  Embed YouTube Videos
//
//  Created by Leonardo Bilia on 30/03/20.
//  Copyright © 2020 Leonardo Bilia. All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @State private var youTubeURL: String = ""
    @State private var youTubeVideoID: String = ""
    @State private var validYouTubeURL = false
    @State private var showingAlert = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField("YouTube Video Link", text: $youTubeURL)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
                
                Button(action: {
                    if let videoID = self.youTubeURL.extractYoutubeID() {
                        self.youTubeURL = ""
                        self.youTubeVideoID = videoID
                        self.validYouTubeURL = true
                
                    } else {
                        self.youTubeURL = ""
                        self.showingAlert = true
                    }
                    
                }) {
                    HStack {
                        Image(systemName: "video.fill")
                            .font(.headline)
                        Text("Embed Video")
                            .fontWeight(.semibold)
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.systemBlue), Color(.systemPurple)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Ops!!"), message: Text("It doesn't look like a valid YouTube link!"), dismissButton: .default(Text("Ok")))
                }
                
                Divider()
                    .padding()
                
                if validYouTubeURL {
                    WebView(videoID: self.youTubeVideoID)
                        .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                        .padding(.top)
                }
                
                Spacer()
            }
            .navigationBarTitle("Embed Video")
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
