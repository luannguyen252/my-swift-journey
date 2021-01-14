//
//  BlogView.swift
//  TabBarTutorial
//
//  Created by Alpar Matyas on 10/09/2019.
//  Copyright © 2019 Alpar Matyas. All rights reserved.
//

import SwiftUI

struct BlogView: View {
    
    @State var animation = true
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: { self.animation.toggle() }) {
            Text("MVVM in Swift")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .shadow(color: .gray, radius: 10, x: 0, y: 10)
            }  
                .offset(y: animation ? UIScreen.main.bounds.height / 2.5 : 0)
                .animation(.easeInOut(duration: 2))
            
            Text("      Mvvm in swift is an mvc alternative. It is one of the design patterns that got mainstream attention. Mvvm ios or mvvm swift is not documented and there are a few ways you can start with it. \n      In this mvvm swift tutorial for beginners I’ll try to explain mvvm in swift 5 with an example. If you’re looking for an mvvm vs mvc than you need to be comfortable with mvc first. \n   Learn the mvvm swift protocol, mvvm in swift 5! So what does this mvvm swift 5 tutorial teach you? First I’ll show you an mvvm ios example. This is an mvvm ios tutorial for beginners so you can get started quickly. \nSo if you’re looking for an mvvm ios tutorial, an mvvm ios swift tutorial or mvvm in swift example than keep on watching this mvvm ios swift example! \n All you have to do is watch my new video and then CLICK HERE to download the resources: https://store.rebeloper.com/youtube-channel-resources")
                .font(.body)
                .foregroundColor(.gray)
                .lineSpacing(10)
                .lineLimit(23)
                .opacity(animation ? 0 : 1)
                .animation(Animation.easeInOut(duration: 3))
        }
        .frame(minHeight: 0, maxHeight: .infinity)
        .padding(.horizontal, 20)
//        .onAppear { self.animation.toggle() }
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView()
    }
}
