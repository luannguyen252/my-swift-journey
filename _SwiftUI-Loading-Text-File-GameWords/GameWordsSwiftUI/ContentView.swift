//
//  ContentView.swift
//  GameWordsSwiftUI
//
//  Created by Bao Vu on 7/9/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentWord = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Hello Word")
            }
            .navigationBarTitle(currentWord)
            .onAppear {
                self.startGame()
            }
        }
    }
    
    func startGame(){
        if let startWordsURL = Bundle.main.url(forResource: "BaoVu", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL){
                let allWords = startWords.components(separatedBy: "\n")
                currentWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load BaoVu.txt from bundle")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
