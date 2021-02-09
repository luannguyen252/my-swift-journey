//
//  ResultsView.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/30/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Results View
struct ResultsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var settings: SettingsViewModel
    
    @State private var errorMessageIsShowing: Bool = false
    @State private var error: PasswordError?
    
    @State private var passwords: [String] = []
    private var progress: String {
        let ratio: Double = Double(passwords.count) / Double(settings.quantity)
        let percentage: Double = ratio * 100
        let percentageRounded: String = .init(format: "%.1f", percentage)
        
        let progress: String = "\(passwords.count)/\(settings.quantity) (\(percentageRounded)%)"
        
        return progress
    }
    
    @State private var clipboardMessageIsShowing: Bool = false
    {
        willSet {
            guard newValue == true else { return }

            clipboardMessageTimer?.invalidate()
            clipboardMessageTimer = nil
            
            clipboardMessageTimer = .scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in
                clipboardMessageIsShowing = false
            })
        }
    }
    @State private var clipboardMessageTimer: Timer?
}

// MARK:- Body
extension ResultsView {
    var body: some View {
        VStack(content: {
            header
            passwordsList
        })
            .padding(10)
            .frame(size: Layout.view)
            
            .background(Color.listBackground)   // Override on NSTableView is done in Colors.swift
            
            .onAppear(perform: generate)
        
            .alert(isPresented: $errorMessageIsShowing, content: {
                Alert(
                    title: .init(error?.localizedDescription ?? ""),
                    message: .init(error?.detalizedDescription ?? ""),
                    dismissButton: .cancel({ presentationMode.wrappedValue.dismiss() })
                )
            })
    }
    
    private var header: some View {
        HStack(content: {
            Group(content: {
                Button("Back", action: {
                    cancellGeneration()
                    presentationMode.wrappedValue.dismiss()
                })
            })
                .frame(width: Layout.headerCornerItem.width, alignment: .leading)
            
            Spacer()
            
            Text(clipboardMessageIsShowing ? "Password has been copied to the clipboard" : "Double-tap a password to copy")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(progress)
                .frame(width: Layout.headerCornerItem.width, alignment: .trailing)
                .font(.system(.caption, design: .monospaced))
                .foregroundColor(.secondary)
        })
    }
    
    private var passwordsList: some View {
        List(content: {
            ForEach(passwords.enumeratedArray(), id: \.offset, content: { (i, password) in
                row(i: i, pass: password)
            })
        })
    }
    
    private func row(i: Int, pass: String) -> some View {
        HStack(content: {
            number(i)
            password(i, password: pass)
        })
            .padding(.trailing, 7)
    }
    
    private func number(_ i: Int) -> some View {
        ZStack(content: {
            Circle()
                .foregroundColor(.formBackground)
            
            Text(String(i + 1))
                .frame(width: Layout.numbering.width)
                .padding(5)
                .font(.footnote)
                .foregroundColor(.secondary)
        })
            .frame(height: Layout.row.height)
            .fixedSize(horizontal: true, vertical: false)
    }
    
    private func password(_ i: Int, password: String) -> some View {
        ZStack(alignment: .leading, content: {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.formBackground)
            
            VStack(alignment: .leading, spacing: 3, content: {
                ForEach(Array(password).chunked(into: 50), id: \.self, content: { chunk in
                    Text(String(chunk))
                })
            })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .truncationMode(.tail)
        })
            .onTapGesture(count: 2, perform: { copyToClipboard(from: i) })
    }
}

// MARK:- Generate
private extension ResultsView {
    func generate() {
        PasswordGeneratorController.shared.generate(completion: { result in
            DispatchQueue.main.async(execute: {
                switch result {
                case .success(let password):
                    passwords.append(password)
                
                case .failure(let error):
                    switch error {
                    case .invalidConfiguration, .couldntLoadWords:
                        self.error = error
                        errorMessageIsShowing = true
                    
                    case .couldntGenerate:
                        break
                    }
                }
            })
        })
    }
    
    func cancellGeneration() {
        PasswordGeneratorController.shared.shouldContinue = false
    }
}

// MARK:- Copy
private extension ResultsView {
    func copyToClipboard(from index: Int) {
        let pasteboard: NSPasteboard = .general
        pasteboard.declareTypes([.string], owner: nil)

        pasteboard.setString(passwords[index], forType: .string)
        
        clipboardMessageIsShowing = true
        NSSound(named: "Tink")?.play()
    }
}

// MARK:- Layout
extension ResultsView {
    struct Layout {
        // MARK: Properties
        static let view: CGSize = .init(width: MainView.Layout.window.width - 40, height: MainView.Layout.window.height - 20)
        
        static let headerCornerItem: CGSize = .init(width: 150, height: -1)
        
        static let numbering: CGSize = .init(width: 25, height: -1)
        static let row: CGSize = .init(width: -1, height: 35)
        
        // MARK: Initializers
        private init() {}
    }
}

// MARK:- Preview
struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
            .environmentObject(SettingsViewModel())
    }
}
