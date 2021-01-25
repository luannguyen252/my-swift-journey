//
//  DismissKeyboardHelper.swift
//  BirthdayApp
//
//  Created by jb on 2020/10/13.
//

import UIKit

class DismissKeyboardHelper {
    static func dismiss(){
        let keyWindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow?.endEditing(true)
    }
}

