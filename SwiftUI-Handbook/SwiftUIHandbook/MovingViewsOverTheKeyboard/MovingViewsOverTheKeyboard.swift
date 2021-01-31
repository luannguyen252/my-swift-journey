//
//  MovingViewsOverTheKeyboard.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 25/12/2020.
//

import SwiftUI

struct MovingViewsOverTheKeyboard: View {
    @State var text = ""
    @State var value: CGFloat = 0
    
    var body: some View {
        VStack {
            List(0..<100) { _ in
                Text("Hello, World!")
            }
            
            TextField("Type something", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
        }
        .offset(y: -self.value)
        .animation(.spring())
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                self.value = height
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main) { (noti) in
                self.value = 0
            }
        }
    }
}

struct MovingViewsOverTheKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        MovingViewsOverTheKeyboard()
    }
}
