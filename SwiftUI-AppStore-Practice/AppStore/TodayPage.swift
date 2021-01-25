//
//  TodayPage.swift
//  AppStore
//
//  Created by jb on 2020/10/08.
//

import Foundation
import SwiftUI

struct TodayView: View {
    var body: some View {
        ScrollView{
            HStack{
                VStack(alignment: .leading){
                    Text("Thursday, October 15").foregroundColor(.gray).bold().font(Font.footnote)
                    Text("Today").font(Font.largeTitle).bold()
                }
                Spacer()
                Button(action: self.loadProfile, label: {
                    Image("Profile").resizable().frame(width: 40, height: 40, alignment: .trailing)
                })
                
            }.padding([.leading, .trailing, .top])
            HighlightView(category: "Song", title: "Title String. This is Title", message: "Message String").frame(height: 550, alignment: .leading)
            HighlightView(category: "Song", title: "Title String. This is Title", message: "Message String").frame(height: 550, alignment: .leading)
            HighlightView(category: "Song", title: "Title String. This is Title", message: "Message String").frame(height: 550, alignment: .leading)
        }
    }
    func loadProfile(){
        
    }
}

struct HighlightView : View {
    var category : String
    var title: String
    var message: String
    var body : some View {
        VStack{
            ZStack{
                Image("justimage").resizable()
                LinearGradient(gradient: Gradient(colors: [.clear, Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .leading){
                    Text(category).foregroundColor(Color.white.opacity(0.5)).bold()
                    Text(title).foregroundColor(.white).font(Font.title).bold()
                    Spacer()
                    Text(message).foregroundColor(.white)
                }.padding()
            }
            
        }.cornerRadius(30).padding().shadow(radius: 4)
    }
}


struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
