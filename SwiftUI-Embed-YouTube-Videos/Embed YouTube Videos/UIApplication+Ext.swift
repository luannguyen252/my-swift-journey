//
//  UIApplication+Ext.swift
//  Embed YouTube Videos
//
//  Created by Leonardo Bilia on 30/03/20.
//  Copyright © 2020 Leonardo Bilia. All rights reserved.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
