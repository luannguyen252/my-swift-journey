//
//  Button-EffectModifiers.swift
//  100Views
//
//  Created by Mark Moeykens on 6/14/19.
//  For Book
//

import SwiftUI

struct Button_EffectModifiers : View {
    var body: some View {
        VStack(spacing: 35) {
            Text("Button").font(.largeTitle)
            Text("With Backgrounds").font(.title).foregroundColor(.gray)
            Text("As with most views, we can also customize the background and add a shadow.")
                .padding().frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white).font(.title)
            
            Button(action: {}) {
                Text("Solid Button")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            Button(action: {}) {
                Text("Button With Shadow")
                    .padding(12)
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            .shadow(color: Color.purple, radius: 20, y: 5)  // See more info in section on Shadows
            
            Button(action: {}) {
                Text("Button With Rounded Ends")
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .cornerRadius(100) // A number higher than the height of the button will always give you the perfect corner
            }
        }
    }
}

struct Button_EffectModifiers_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            Button_EffectModifiers()
        }
    }
}
