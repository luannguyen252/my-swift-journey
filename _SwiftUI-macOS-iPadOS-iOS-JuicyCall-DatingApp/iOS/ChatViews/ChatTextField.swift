//
//  ChatTextField.swift
//  Juicy Call 2 (iOS)
//
//  Created by Tony Hajdini on 08/09/2020.
//

import SwiftUI

struct ChatTextField: View {
    @State private var mess: String = ""
    @State private var showingActionSheet: Bool = false
    var body: some View {
        HStack {
            Button(action: {
                self.showingActionSheet.toggle()
            }, label: {
                Image(systemName: "plus").foregroundColor(Color.accentColor)
            })
                 .actionSheet(isPresented: $showingActionSheet) {
                        ActionSheet(title: Text(""), message: Text(""), buttons: [
                            .default(Text("Gallery")) {},
                            .default(Text("Camera")) {},
                            .default(Text("Blue")) {},
                            .cancel()
                        ])
                    }
            TextField("Message",text:$mess).padding(5).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0))
                        .background(BlurView(style: .regular)).cornerRadius(20)
            if mess != "" {
                Button(action: {
                    // To Photo Gallery
                }, label: {
                    Image(systemName: "paperplane.circle.fill").font(.system(size:30)).foregroundColor(Color.blue)
                }).buttonStyle(BorderlessButtonStyle())
            }
        }
        .animation(.easeOut)
        .padding(.all)
        .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! - 10)
        .background(BlurView(style: .regular))
    }
}

struct ChatTextField_Previews: PreviewProvider {
    static var previews: some View {
        ChatTextField()
    }
}
