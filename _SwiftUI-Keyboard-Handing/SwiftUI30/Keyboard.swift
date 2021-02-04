//
//  Keyboard.swift
//  SwiftUI30
//
//  Created by Rohit Saini on 08/08/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import Foundation
import SwiftUI

struct Keyboard: ViewModifier{
    @State var offset: CGFloat = 0
    func body(content: Content) -> some View{
        content.padding(.bottom,offset).onAppear{
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                let value = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
                self.offset = value?.height ?? 0
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                self.offset = 0
            }
        }
    }
}


extension View{
    func handleKeyboard() -> ModifiedContent<Self,Keyboard>{
        return modifier(Keyboard())
    }
}
