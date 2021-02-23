//
//  Welcome.swift
//  Playground
//
//  Created by Nav Singh on 8/20/20.
//

import SwiftUI

struct Welcome: View {
    var color: Color = Color(UIColor.systemBlue).opacity(0.8)
    var body: some View {
        VStack (alignment: .leading) {
            Text("Welcome to").font(.system(size: 50)).fontWeight(.heavy).foregroundColor(.primary)
            Text("Stocks").font(.system(size: 50)).fontWeight(.heavy).foregroundColor(color)
            
            Spacer()
            
            VStack (alignment: .leading, spacing: 24) {
                HStack (alignment: .top, spacing: 20) {
                        Image(systemName: "chart.bar.fill").resizable().frame(width: 40, height: 40).foregroundColor(color)
                        
                        VStack (alignment: .leading, spacing: 4) {
                            Text("All New Design").font(.headline).bold()
                            
                            Text("Easily View Stock Options, Quotes, Charts etc.").font(.subheadline)
                        }
                    }
              
              HStack (alignment: .top, spacing: 20) {
                        Image(systemName: "chart.bar.fill").resizable().frame(width: 40, height: 40).foregroundColor(color)
                        
                        VStack (alignment: .leading, spacing: 4) {
                            Text("All New Design").font(.headline).bold()
                            
                            Text("Easily View Stock Options, Quotes, Charts etc.").font(.subheadline)
                        }
                    }
              
              HStack (alignment: .top, spacing: 20) {
                        Image(systemName: "chart.bar.fill").resizable().frame(width: 40, height: 40).foregroundColor(color)
                        
                        VStack (alignment: .leading, spacing: 4) {
                            Text("All New Design").font(.headline).bold()
                            
                            Text("Easily View Stock Options, Quotes, Charts etc.").font(.subheadline)
                        }
                    }
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("Welcome").foregroundColor(.white).bold()
            }.frame(width: 280, height: 60).background(color).cornerRadius(12)
        }.padding(.all, 40)
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Welcome()
        }
    }
}