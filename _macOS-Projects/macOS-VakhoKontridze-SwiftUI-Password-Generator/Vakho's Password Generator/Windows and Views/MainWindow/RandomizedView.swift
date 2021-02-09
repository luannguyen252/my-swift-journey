//
//  RandomizedView.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Randomized View
struct RandomizedView: View {
    @EnvironmentObject private var settings: SettingsViewModel
}

// MARK:- Body
extension RandomizedView {
    var body: some View {
        VStack(spacing: 10, content: {
            characters
            additionalSettings
            separator
        })
    }
    
    private var characters: some View {
        SectionView(content: {
            HStack(content: {
                CheckBoxView(isOn: $settings.random.lowercase.isIncluded.onChange(settings.random.syncFirstChar), characters: .lowercase)
                Spacer()
                NumberPickerView(value: $settings.random.lowercase.weight.onChange(settings.random.syncWeights), useSlider: true, range: Characters.weightRange)
                    .frame(width: ViewModel.weightsSection.width)
                    .disabled(!settings.random.lowercase.isIncluded)
            })
            
            HStack(content: {
                CheckBoxView(isOn: $settings.random.uppercase.isIncluded.onChange(settings.random.syncFirstChar), characters: .uppercase)
                Spacer()
                NumberPickerView(value: $settings.random.uppercase.weight.onChange(settings.random.syncWeights), useSlider: true, range: Characters.weightRange)
                    .frame(width: ViewModel.weightsSection.width)
                    .disabled(!settings.random.uppercase.isIncluded)
            })
            
            HStack(content: {
                CheckBoxView(isOn: $settings.random.digits.isIncluded, characters: .digits)
                Spacer()
                NumberPickerView(value: $settings.random.digits.weight.onChange(settings.random.syncWeights), useSlider: true, range: Characters.weightRange)
                    .frame(width: ViewModel.weightsSection.width)
                    .disabled(!settings.random.digits.isIncluded)
            })
            
            HStack(content: {
                CheckBoxView(isOn: $settings.random.symbols.isIncluded, characters: .symbols)
                Spacer()
                NumberPickerView(value: $settings.random.symbols.weight.onChange(settings.random.syncWeights), useSlider: true, range: Characters.weightRange)
                    .frame(width: ViewModel.weightsSection.width)
                    .disabled(!settings.random.symbols.isIncluded)
            })
            
            HStack(content: {
                CheckBoxView(isOn: $settings.random.ambiguous.isIncluded, characters: .ambiguous)
                Spacer()
                NumberPickerView(value: $settings.random.ambiguous.weight.onChange(settings.random.syncWeights), useSlider: true, range: Characters.weightRange)
                    .frame(width: ViewModel.weightsSection.width)
                    .disabled(!settings.random.ambiguous.isIncluded)
            })
            
            Spacer()
                .frame(height: 20)

            HStack(spacing: 3, content: {
                Text("Readability: ")
                    .frame(width: ViewModel.header.width)

                Picker(
                    selection: $settings.random.readability.onChange(settings.random.syncReadability),
                    label: EmptyView(),
                    content: {
                        ForEach(Readability.allCases, id: \.self, content: { readability in
                            Text(readability.title)
                        })
                    }
                )
                    .frame(width: ViewModel.readabilityPicker.width)
            })
        })
    }
    
    private var additionalSettings: some View {
        SectionView(content: {
            ForEach(AdditionalSetting.allCases, content: { setting in
                CheckBoxView(
                    isOn: .init(
                        get: { settings.random.additionalSettings.contains(setting) },
                        set: { settings.random.setAndSyncAdditionalSettings(setting, to: $0) }
                    ),
                    
                    setting: setting
                )
            })
        })
    }
    
    private var separator: some View {
        SectionView(title: nil, content: {
            HStack(spacing: 3, content: {
                CheckBoxView(isOn: $settings.random.separator.isEnabled, title: "Add a separator every ")
                
                HStack(spacing: 3, content: {
                    NumberPickerView(value: $settings.random.separator.characterChunkQuantity, range: Separator.range)
                        .disabled(!settings.random.separator.isEnabled)
                    
                    Text(" characters")
                        .onTapGesture(perform: { settings.random.separator.isEnabled.toggle() })
                })
            })
                .foregroundColor(settings.random.separator.isEnabled ? .primary : .secondary)
        })
    }
}

// MARK: View Model
extension RandomizedView {
    struct ViewModel {
        // MARK: Properties
        static let header: CGSize = MainView.Layout.header
        static let weightsSection: CGSize = .init(width: 300, height: -1)
        static let readabilityPicker: CGSize = .init(width: 100, height: -1)
        
        // MARK: Initializers
        private init() {}
    }
}


// MARK:- Preview
struct RandomizedView_Previews: PreviewProvider {
    static var previews: some View {
        RandomizedView()
            .environmentObject(SettingsViewModel())
        
            .frame(width: MainView.Layout.view.width)
    }
}
