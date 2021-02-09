//
//  MainView.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/12/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Main View
struct MainView: View {
    @EnvironmentObject private var settings: SettingsViewModel
}

// MARK:- Body
extension MainView {
    var body: some View {
        VStack(spacing: 10, content: {
            convert
            if settings.conversionCase == .title {
                principals
                specialWords
                delimiters
                customWords
            }
        })
            .padding(10)
            .frame(size: Layout.view, alignment: .top)
    }
    
    private var convert: some View {
        SectionView(content: {
            VStack(spacing: 10, content: {
                TextField("", text: $settings.title)
                
                HStack(spacing: 10, content: {
                    Picker(
                        selection: $settings.conversionCase,
                        label: EmptyView(),
                        content: {
                            ForEach(ConversionCase.allCases, id: \.self, content: { conversion in
                                Text(conversion.title)
                            })
                        }
                    )
                        .frame(width: Layout.picker.width)
                    
                    Spacer()
                    
                    Button("Convert", action: { settings.convert() })
                        .disabled(settings.title.isEmpty)
                    
                    Spacer()
                    
                    Button("Clear", action: { settings.title = "" })
                        .frame(width: Layout.picker.width, alignment: .trailing)
                })
            })
        })
    }
    
    private var principals: some View {
        SectionView(content: {
            HStack(spacing: 0, content: {
                CheckBoxView(
                    isOn: $settings.principalWords.ticked,
                    title: "Capitalize verbs, nouns, adjectives, adverbs, and pronouns of "
                )
                
                NumberPickerView(value: $settings.principalWords.length, range: settings.principalWords.range)
                    .padding(.horizontal, 5)
                    .disabled(!settings.principalWords.ticked)
                
                Text(" letters or more")
                    .onTapGesture(count: 1, perform: { settings.principalWords.ticked.toggle() })
            })
        })
    }
    
    private var specialWords: some View {
        SectionView(content: {
            VStack(alignment: .leading, spacing: 10, content: {
                HStack(spacing: 0, content: {
                    CheckBoxView(
                        isOn: $settings.specialWords.ticked.onChange(settings.syncSpecialWord),
                        title: "Do not capitalize Articles, Prepositions, and Conjunctions of "
                    )
                    
                    NumberPickerView(value: $settings.specialWords.length, range: settings.specialWords.range)
                        .padding(.horizontal, 5)
                        .disabled(!settings.specialWords.ticked)
                    
                    Text(" letters or less")
                        .onTapGesture(count: 1, perform: { settings.specialWords.ticked.toggle() })
                    
                    Spacer()
                    
                    Button(action: { SpecialWordsWindow.shared.createWindow() }, label: { Symbols.navigateToWindow })
                        .buttonStyle(PlainButtonStyle())
                })
                
                Group(content: {
                    ForEach(SpecialWord.allCases, content: { specialWord in
                        CheckBoxView(
                            isOn: Binding<Bool>(
                                get: {
                                    settings.specialWordsPool.contains(specialWord)
                                },
                                set: { isIncluded in
                                    switch isIncluded {
                                    case false: settings.specialWordsPool.remove(specialWord)
                                    case true: settings.specialWordsPool.insert(specialWord)
                                    }
                                }
                            )
                                .onChange(settings.syncSpecialWords)
                            ,
                            
                            specialWord: specialWord
                        )
                    })
                })
                    .padding(.leading, 23)
            })
        })
    }
    
    private var delimiters: some View {
        SectionView(content: {
            CheckBoxView(
                isOn: $settings.capitalizeDelimetered,
                title: "Capitalize words before and after delimiters",
                details: Characters.Delimiters.list
            )
        })
    }
    
    private var customWords: some View {
        SectionView(content: {
            HStack(content: {
                CheckBoxView(isOn: $settings.useCustomWords, title: "Use custom words")
                
                Spacer()
                
                Button(action: { CustomWordsWindow.shared.createWindow() }, label: { Symbols.navigateToWindow })
                    .buttonStyle(PlainButtonStyle())
            })
        })
    }
}

// MARK:- Layout
extension MainView {
    struct Layout {
        // MARK: Properties
        static let window: CGSize = .init(width: view.width, height: view.height + titleBar.height)
        static let titleBar: CGSize = .init(width: -1, height: 22)
        
        static let view: CGSize = .init(width: 670, height: 650)
        
        static let picker: CGSize = .init(width: 135, height: -1)

        // MARK: Initializers
        private init() {}
    }
}

// MARK:- Symbols
extension MainView {
    struct Symbols {
        // MARK: Properties
        static var navigateToWindow: some View {
            Text("→")
                .padding(3)
                .background(Circle().foregroundColor(.secondary))
        }

        // MARK: Initializers
        private init() {}
    }
}

// MARK:- Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(SettingsViewModel())
    }
}
