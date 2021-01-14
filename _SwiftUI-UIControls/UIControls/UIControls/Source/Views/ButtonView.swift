//
//  ButtonView.swift
//  UIControls
//
//  Created by Sud on 6/19/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct ButtonView : View {
    
    var body: some View {
        VStack {
            UnicodeTextButtonView()
            Divider()
            PlainButtonView()
            Divider()
            ImageButtonView()
            Divider()
            ImageAndTextButtonView()
            Spacer()
        }
        .navigationBarTitle(Text("Button"))
    }
}

struct UnicodeTextButtonView: View {
    @State var selectedHeart = "❤️"
    
    var body: some View {
        HStack {
            Text("Pick a heart").padding(.leading)
            Spacer()
            Text(selectedHeart)
            Spacer()
            
            Button(action: {
                self.selectedHeart = "❤️"
            }, label: {
                Text("❤️")
            })
            
            Button(action: {
                self.selectedHeart = "💙"
            }, label: {
                Text("💙")
            })
            
            Button(action: {
                self.selectedHeart = "💚"
            }, label: {
                Text("💚")
            })
            .padding(.trailing)
        }
        .padding([.top, .bottom])
    }
}

struct PlainButtonView: View {
    var body: some View {
        HStack {
            Text("Plain Button").padding(.leading)
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Tap Me")
            })
            .padding(.trailing)
        }
        .padding([.top, .bottom])
    }
}

struct ImageButtonView: View {
    var body: some View {
        HStack {
            Text("Image Button").padding(.leading)
            Spacer()
            Button(action: {
                
            }, label: {
                Image("Car").renderingMode(.template).foregroundColor(Color.white)
            })
            .padding()
            .background(Color.blue)
            .cornerRadius(30.0)
            .padding()
        }
        .padding([.top, .bottom])
    }
}

struct ImageAndTextButtonView: View {
    var body: some View {
        HStack {
            Text("Text and Image Button").padding(.leading)
            Spacer()
            Button(action: {
                
            }, label: {
                VStack {
                    Image("Car").renderingMode(.template).foregroundColor(Color.white)
                    Text("Car").foregroundColor(.white)
                }
            })
            .padding()
            .background(Color.blue)
            .cornerRadius(10.0)
            .padding()
        }
        .padding([.top, .bottom])
    }
}

#if DEBUG
struct ButtonView_Previews : PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
#endif
