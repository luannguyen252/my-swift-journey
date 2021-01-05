//
//  ContentView.swift
//  Find Words
//
//  Created by Stephen DeStefano on 3/8/20.
//  Copyright © 2020 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonTapped = false
    @State private var textFieldTapped = false
    @State private var allWords = [String]()
    @State private var baseWord = ""
    @State private var wordLetterCount = ""
    @State private var guessedWords = [String]()
    @State private var newWord = ""
    @State private var errorMessageIsShown = false
    @State private var errorTitle = ""
    @State private var errorDescription = ""
    //haptic feedback
    var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - PROPERTIES
    
    @State var showSettings: Bool = false
    
    //this initializer will let you customize the picker segment
    init() {
        //the forground color of each selected segment
        UISegmentedControl.appearance().selectedSegmentTintColor = .black
        //the color of the title for the selected segment
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        //the color of the title for the unselected segment
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    //retrieve the picker selection from user defaults
    var selectedSegment: Int {
        get {
            return UserDefaults.standard.integer(forKey: "selectedSegment")
        }
    }
    
    //retrieve the english language from user defaults
    var englishIsOn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "englishIsOn")
        }
    }
    
    //retrieve the spanish selection from user defaults
    var spanishIsOn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "spanishIsOn")
        }
    }
    
    //retrieve the italian selection from user defaults
    var italianIsOn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "italianIsOn")
        }
    }
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                
                //MARK: - HEADER
                HeaderView(showSettingsView: $showSettings)
                
                //MARK: - PICKER
                PickerView(textFieldTapped: $textFieldTapped, buttonTapped: $buttonTapped)
                
                //MARK: - BUTTON VSTACK
                VStack {
                    //bar
                    Image("topBar").resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 280, height: 8)
                        .padding(.bottom, 5)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                    
                    Button(action: {
                        //call the reset function to get a new random word and clear out the text field and list
                        playSound(sound: "buttonClick", type: "m4a")
                        self.hapticImpact.impactOccurred()
                        self.reset()
                        self.buttonTapped.toggle()
                    }){
                        ZStack {
                            Image("background").resizable()
                                .renderingMode(.original)
                                .frame(width: 125, height: 50)
                                .cornerRadius(15)
                            Text("New Word")
                                .foregroundColor(.white)
                        }
                    }.padding(7)
                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                        .shadow(color: .black, radius: 2, x: -1, y: -1)
                    
                    VStack(alignment: .center, spacing: 0) {
                        //word letter count string
                        Text("\(wordLetterCount)")
                            .font(.system(size: 13, weight: .light, design: .serif))
                            .foregroundColor(Color.white)
                            .bold()
                            .shadow(color: .black, radius: 1, x: 1, y: 1)
                        
                        HStack {
                            //right hand image
                            Image(systemName: "hand.point.right")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                                //animate the right hand with a spring
                                .animation(.spring(dampingFraction:0.2))
                            
                            //base word
                            Text("\(baseWord)")
                                .font(.custom("HelveticaNeue-Medium", size: 38))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 1, x: 1, y: 1)
                                //animate the new word in by growing it
                                .scaleEffect(self.buttonTapped ? 0 : 1)
                                .animation(.easeIn(duration: 0.2))
                            
                            //left hand image
                            Image(systemName:"hand.point.left")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                                .padding(-4)
                                //animate the left hand with a spring
                                .animation(.spring(dampingFraction:0.3))
                        }
                        //bar
                        Image("bottomBar").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 280, height: 8)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            .shadow(color: .black, radius: 1, x: 1, y: 1)
                    }
                }
                
                //MARK: - TEXT FIELD - LIST TABLE
                
                //text field
                VStack(alignment: .center, spacing: 10) {
                    TextField("Enter your word", text: $newWord, onCommit: {
                        self.addNewWord()
                        self.textFieldTapped = true
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .autocapitalization(.none)
                    
                    List(guessedWords, id: \.self) {
                        Text($0)
                        Image(systemName: "\($0.count).circle")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }
                    .frame(width: 285, height: 190, alignment: .center)
                    .cornerRadius(10)
                    .foregroundColor(Color.blue)
                    .font(.system(size: 20))
                }//add the alert popup
                    .alert(isPresented: $errorMessageIsShown) {
                        Alert(title: Text(errorTitle), message: Text(errorDescription), dismissButton: .default(Text("OK")))
                }
                
               //MARK: - FOOTER - FOUND WORDS - AVERAGE LETTERS
                             
                             FooterView(textFieldTapped: $textFieldTapped, guessWords: $guessedWords)
                             
                             Spacer()
                
                        }.background(Image("background").resizable() .edgesIgnoringSafeArea([.all])
                             .aspectRatio(contentMode: .fill)
                             .frame(width: 500, height: 800))
                             .onAppear {
                             self.startGame()
                         }
                         SplashView()
                     }
                 }
    
    //MARK: - FUNCTIONS
    
     func startGame() {
            if let wordsURL = Bundle.main.url(forResource: languageSet(), withExtension: "txt") {
               if let wordsConverted = try? String(contentsOf: wordsURL) {
                   allWords = wordsConverted.components(separatedBy: "\n")
                   baseWord = allWords.randomElement() ?? "Swifty"
                   return
               }
           }
           fatalError("There was a problem loading the data file from the bundle.")
       }
    
     func languageSet() -> String {
         var dataFile = ""
         
         //english
         if englishIsOn == true {
             if selectedSegment == 1 {
                 dataFile = "7LetterWordsEn"
                 wordLetterCount = "🇱🇷 7 letter word - English 🇱🇷"
             } else if selectedSegment == 2 {
                 dataFile = "8LetterWordsEn"
                 wordLetterCount = "🇱🇷 8 letter word - English 🇱🇷"
             } else if selectedSegment == 3 {
                 dataFile = "9LetterWordsEn"
                 wordLetterCount = "🇱🇷 9 letter word - English 🇱🇷"
             }
         }
         
         //spanish
         if spanishIsOn == true {
             if selectedSegment == 1 {
                 dataFile = "7LetterWordsES"
                 wordLetterCount = "🇪🇸 7 letter word - Spanish 🇪🇸"
             } else if selectedSegment == 2 {
                 dataFile = "8LetterWordsES"
                 wordLetterCount = "🇪🇸 8 letter word - Spanish 🇪🇸"
             } else if selectedSegment == 3 {
                 dataFile = "9LetterWordsES"
                 wordLetterCount = "🇪🇸 9 letter word - Spanish 🇪🇸"
             }
         }
         
         //italian
         if italianIsOn == true {
             if selectedSegment == 1 {
                 dataFile = "7LetterWordsIt"
                 wordLetterCount = "🇮🇹 7 letter word - Italian 🇮🇹"
             } else if selectedSegment == 2 {
                 dataFile = "8LetterWordsIt"
                 wordLetterCount = "🇮🇹 8 letter word - Italian 🇮🇹"
            }
             if selectedSegment == 3 {
                 dataFile = "9LetterWordsIt"
                 wordLetterCount = "🇮🇹 9 letter word - Italian 🇮🇹"
             }
         }
         return dataFile
     }
    
    func reset() {
        startGame()
        baseWord = allWords.randomElement() ?? "Swifty"
        guessedWords = [String]()
        newWord = ""
    }
    
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        //guard against single letter words - theres only a handful, and there too easy
        guard answer.count > 1 else {
            return
        }
        
        //is the word original? - no duplicate words allowed in your list
        guard isWordOriginal(word: answer) else {
            displayErrorMessage(messageTitle: "You already used this word", description: "Keep looking!")
            return
        }
        
        //is the word possible given your base word letters to work with? - only valid words please
        guard isWordPossible(userGuessWord: answer) else {
            displayErrorMessage(messageTitle: "This word is not possible", description: "Create only words from the letters in the given word")
            return
        }
        
        //is the word a real word in its chosen language? - only real words allowed
        guard isWordReal(word: answer) else {
            displayErrorMessage(messageTitle: "This is not a valid word", description: "Use only real words")
            return
        }
        guessedWords.insert(newWord, at: 0)
        newWord = ""
    }
    
    //is the word original?
     func isWordOriginal(word: String) -> Bool {
           return !guessedWords.contains(word)
       }
    
    //is the word possible
    func isWordPossible(userGuessWord: String) -> Bool {
        var tempWord = baseWord
        
        for letter in userGuessWord {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    //is the word real
    func isWordReal(word: String) -> Bool {
        //create an instance of UTTextChecker - this checks for misspelled words
               let checkWord = UITextChecker()
               let range = NSRange(location: 0, length: word.utf16.count)
               
               //set the language the user selected
               var language = ""
               if englishIsOn == true {
                   language = "en"
               }
               if spanishIsOn == true {
                   language = "es"
               }
               if italianIsOn == true {
                   language = "it"
               }
               let misspelledRange = checkWord.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: language)
               
                return misspelledRange.location == NSNotFound
           }
    
    //error function
    func displayErrorMessage(messageTitle: String, description: String) {
        errorTitle = messageTitle
        errorDescription = description
        errorMessageIsShown = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
