//
//  TextFieldAnimation.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/10.
//

import SwiftUI

struct TextFieldAnimation: View {
    
    @State var text: String = ""
    @State var isEditing = true
    
    var body: some View {
        
        ZStack {
            Color(.blue).opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                Group {
                    TextField("input something", text: $text) { value in
                        print("onEditingChanged: \(value)")
                    } onCommit: {
                        print("onCommit")
                    }
                    .font(.system(size: 34, weight: .regular))
                    .foregroundColor(.black)
                    .accentColor(.blue)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 30)
                    .background( isEditing ?
                                    Color.blue.frame(width: nil, height: nil).offset(x: 0) :
                                    Color.white.frame(width: 0, height: 0).offset(x: 60.0 - (400 / 2.0))
                    )
                    .cornerRadius(15)
                    .animation(.easeIn)
                }
                .padding()
                .onTapGesture {
                    self.isEditing.toggle()
                }
                Spacer()
            }
        }.debugPrint("text: \(text)")
    }
}

struct TextFieldAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldAnimation()
    }
}



