//
//  MainView.swift
//  Vakho's Natural Sorter
//
//  Created by Vakhtang Kontridze on 9/20/20.
//

import SwiftUI

// MARK:- Main View
struct MainView: View {
    @EnvironmentObject private var settings: SettingsViewModel
    
    @State private var text: String = ""
    private var numberOfLines: Int { text.components(separatedBy: .newlines).count }
}

// MARK:- Body
extension MainView {
    var body: some View {
        VStack(spacing: 10, content: {
            header
            textEditor
            footer
        })
            .padding(10)
            .frame(size: Layout.view, alignment: .top)
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            HStack(spacing: 3, content: {
                Toggle("Use", isOn: $settings.numbering.isOn)
                
                Picker("", selection: $settings.numbering.style, content: {
                    ForEach(Numbering.Style.allCases, id: \.self, content: { style in
                        Text(style.title)
                        if style.shouldBeFollowedByDivider { Divider() }
                    })
                })
                    .frame(width: Layout.picker.width)
                    .disabled(!settings.numbering.isOn)
                
                Text(" numbering, and separate with ")
                    .onTapGesture(count: 1, perform: { settings.numbering.isOn.toggle() })
                
                TextField("", text: $settings.numbering.separator)
                    .disabled(!settings.numbering.isOn)
                    .frame(width: Layout.separator.width)
            })
            
            HStack(spacing: 10, content: {
                Toggle("Remove duplicates", isOn: $settings.removeDuplicates)
                Toggle("Fix spacing", isOn: $settings.fixSpacing)
            })
        })
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var textEditor: some View {
        TextEditor(text: $text)
            .border(SeparatorShapeStyle(), width: 2)
    }
    
    private var footer: some View {
        HStack(content: {
            Text("\(numberOfLines) line\(numberOfLines > 1 ? "s" : "")")
                .frame(width: Layout.footerCornerItem.width, alignment: .leading)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button("Sort", action: {
                text = NaturalComparator.sort(text, settings: settings.asNaturalComparisonSettings)
            })
            
            Spacer()
            
            Spacer()
                .frame(width: Layout.footerCornerItem.width, alignment: .trailing)
        })
    }
}

// MARK:- Layout
extension MainView {
    struct Layout {
        // MARK: Properties
        static let window: CGSize = .init(width: view.ideal.width, height: view.ideal.height + titleBar.height)
        static let titleBar: CGSize = .init(width: -1, height: 22)
        
        static let picker: CGSize = .init(width: 300, height: -1)
        static let separator: CGSize = .init(width: 50, height: -1)
        
        static let footerCornerItem: CGSize = .init(width: 100, height: -1)
        
        static let view: SizeConfiguration = .init(
            min: .init(width: 600, height: 600),
            ideal: .init(width: 800, height: 800),
            max: .init(width: CGFloat.infinity, height: CGFloat.infinity)
        )

        // MARK: Initializers
        private init() {}
    }
}

// MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(appDelegate.settings)
    }
}
