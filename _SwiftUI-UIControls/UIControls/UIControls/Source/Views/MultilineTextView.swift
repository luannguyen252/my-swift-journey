//
//  MultilineTextView.swift
//  UIControls
//
//  Created by Sud on 6/20/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct MultilineTextView : View {
    var body: some View {
        HStack {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.").lineLimit(nil)
            .padding([.leading, .trailing])
        }
        .navigationBarTitle(Text("Multiline Text"))
    }
}

#if DEBUG
struct MultilineTextView_Previews : PreviewProvider {
    static var previews: some View {
        MultilineTextView()
    }
}
#endif
