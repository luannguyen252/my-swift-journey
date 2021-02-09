//
//  MainView.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
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
        VStack(content: {
            basic
            contextualSettings
            generate
        })
            .padding(10)
        .frame(size: Layout.view, alignment: .top)
        
            .sheet(isPresented: $settings.passwordsAreBeingGenerated, content: {
                ResultsView()
                    .environmentObject(settings)
            })
    }
    
    private var basic: some View {
        SectionView(content: {
            VStack(alignment: .leading, content: {
                length
                quantity
                type
            })
        })
            .fixedSize(horizontal: false, vertical: true)
    }
    
    private var length: some View {
        HStack(spacing: 3, content: {
            Text("Length: ")
                .frame(width: Layout.header.width, alignment: .leading)

            LogarithmicSliderView(value: $settings.length, range: SettingsViewModel.lengthRange)
                .frame(width: Layout.slider.width)
                .padding(.trailing, 5)

            NumberPickerView(value: $settings.length, range: SettingsViewModel.lengthRange)

            if settings.random.separator.isEnabled {
                Text("+ \(settings.random.separator.length(from: settings.length)) separators")
                    .padding(.leading, 10)
                    .foregroundColor(.secondary)
            }
        })
    }
    
    private var quantity: some View {
        HStack(spacing: 3, content: {
            Text("Quantity: ")
                .frame(width: Layout.header.width, alignment: .leading)
            
            NumberPickerView(value: $settings.quantity, range: SettingsViewModel.quantityRange)
        })
    }
    
    private var type: some View {
        HStack(spacing: 3, content: {
            Text("Type: ")
                .frame(width: Layout.header.width, alignment: .leading)

            Picker(selection: $settings.type, label: EmptyView(), content: {
                ForEach(PasswordType.allCases, id: \.self, content: { type in
                    Text(type.title)
                })
            })
            .frame(width: Layout.typePicker.width)
        })
    }
    
    private var contextualSettings: some View {
        Group(content: {
            if settings.type == .randomized {
                RandomizedView()
            } else {
                VerbalView()
            }
        })
    }
    
    private var generate: some View {
        Button("Generate", action: { settings.passwordsAreBeingGenerated = true })
            .disabled(settings.random.allTypes.filter { $0.isIncluded && $0.weight > 0 }.isEmpty)
    }
}

// MARK:- Layout
extension MainView {
    struct Layout {
        // MARK: Properties
        static let window: CGSize = .init(width: view.width, height: view.height + titleBar.height)
        static let titleBar: CGSize = .init(width: -1, height: 22)
        
        static let view: CGSize = .init(width: 650, height: 732.5)
        
        static let header: CGSize = .init(width: 75, height: -1)
        static let slider: CGSize = .init(width: 200, height: -1)
        static let typePicker: CGSize = .init(width: 120, height: -1)

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
