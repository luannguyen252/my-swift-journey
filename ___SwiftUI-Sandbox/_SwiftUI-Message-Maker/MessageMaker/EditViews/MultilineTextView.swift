//
//  MultilineTextView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String
    var fontSize: CGFloat

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: fontSize)
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.autocapitalizationType = .none
        textView.adjustsFontForContentSizeCategory = true
        textView.delegate = context.coordinator
        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        let cursorLocation = textView.selectedRange.location
        textView.text = text
        textView.selectedRange = NSRange(location: cursorLocation, length: 0)
        textView.scrollRangeToVisible(textView.selectedRange)
    }

    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextView
        
        init(_ parent: MultilineTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}

struct MultilineTextView_Previews: PreviewProvider {
    static var previews: some View {
        MultilineTextView(text: .constant("""
            Here is a long string that will take up several lines.
            one
            two
            three

            and even more




            asdfads



            asdfads

            asdfads



            asdfds

            --- break ---

            and more
            """
            ), fontSize: 20)
            .frame(height: 400)
    }
}
