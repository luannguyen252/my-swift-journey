//
//  CardView.swift
//  SwiftUI-Projects
//
//  Created by Autumn on 2020/9/13.
//

import SwiftUI

struct ECardView: View {
    
    let card: ECard
    @State var isShowAnswer = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                if self.isShowAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 2, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(self.offset.width) > 100 {
                        // 移除卡片
                        self.offset = .zero
                    } else {
                        self.offset = .zero
                    }
                }
        )
        .animation(.spring())
        .onTapGesture {
            self.isShowAnswer.toggle()
        }
    }
}

struct ECardView_Previews: PreviewProvider {
    static var previews: some View {
        ECardView(card: ECard.example)
    }
}


struct ECard {
    let prompt: String
    let answer: String
    static var example: ECard {
        ECard(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
    
}
