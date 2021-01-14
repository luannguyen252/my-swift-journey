//
//  SwitchView.swift
//  SwiftUI2
//
//  Created by Gualtiero Frigerio on 03/08/2020.
//

import SwiftUI

enum SwitchViewType {
    case normal
    case bold
    case italic
    case red
}

struct SwitchView: View {
    private var text:String
    private var type:SwitchViewType
    
    init(text:String, type:SwitchViewType) {
        self.text = text
        self.type = type
    }
    
    var body: some View {
        switch type {
        case .normal:
            ConditionalView(conditionalText: text)
        case .bold:
            Text(text).bold()
        case .italic:
            Text(text).italic()
        case .red:
            Text("following text is red")
            Text(text).foregroundColor(.red)
        }
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView(text:"Test", type:.normal)
    }
}
