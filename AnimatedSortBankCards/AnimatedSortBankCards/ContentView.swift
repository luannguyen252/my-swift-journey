//
//  ContentView.swift
//  AnimatedSortBankCards
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State var move: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                CardView(title: "MSB", color1: Color("msb1"), color2: Color("msb2"))
                    .offset(x: 0, y: move ? -500 : -100)
                    .rotationEffect(move ? .degrees(1) : .degrees(0))
                    .scaleEffect(move ? 1 : 0.75)
                    .onTapGesture {
                        self.move.toggle()
                    }
                
                CardView(title: "VIB", color1: Color("vib1"), color2: Color("vib2"))
                    .offset(x: 0, y: move ? -400 : -80)
                    .rotationEffect(move ? .degrees(2) : .degrees(0))
                    .scaleEffect(move ? 1 : 0.80)
                    .onTapGesture {
                        self.move.toggle()
                    }
                
                CardView(title: "TPBank", color1: Color("tpbank1"), color2: Color("tpbank2"))
                    .offset(x: 0, y: move ? -300 : -60)
                    .rotationEffect(move ? .degrees(4) : .degrees(0))
                    .scaleEffect(move ? 1 : 0.85)
                    .onTapGesture {
                        self.move.toggle()
                    }
            
                CardView(title: "Vietcombank", color1: Color("vietcombank1"), color2: Color("vietcombank2"))
                    .offset(x: 0, y: move ? -200 : -40)
                    .rotationEffect(move ? .degrees(6) : .degrees(0))
                    .scaleEffect(move ? 1 : 0.90)
                    .onTapGesture {
                        self.move.toggle()
                    }
            
                CardView(title: "Techcombank", color1: Color("techcombank1"), color2: Color("techcombank2"))
                    .offset(x: 0, y: move ? -100 : -20)
                    .rotationEffect(move ? .degrees(8) : .degrees(0))
                    .scaleEffect(move ? 1 : 0.95)
                    .onTapGesture {
                        self.move.toggle()
                    }
            
                CardView(title: "MBBank", color1: Color("mbbank1"), color2: Color("mbbank2"))
                    .rotationEffect(move ? .degrees(10) : .degrees(0))
                    .onTapGesture {
                        self.move.toggle()
                    }
            }
            .offset(x: 0, y: move ? 240 : 0)
            .animation(.spring())
            .navigationBarTitle(Text("Bank Cards"), displayMode: .large)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
