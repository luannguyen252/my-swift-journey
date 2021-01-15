//
//  CardCellView.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/15.
//

import SwiftUI

struct CardCellView: View {
    
    @State var cardActived: Bool = false
    
    var body: some View {
        
        ScrollView {
            ZStack {
                Rectangle()
                    .cornerRadius(cardActived ? 0 : 15)
                    .foregroundColor(.green)
                
                VStack(alignment: .leading) {
                    Text("Get Started".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.top, cardActived ? 20 : 0)
                    HStack {
                        Text("Title of the Super App")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 100)
                        Spacer()
                    }
                    Spacer()
                    
                    Text("The most descriptive text ever")
                        .font(.headline)
                        .padding(.bottom)
                }
                .padding()
                
                !cardActived ? nil :
                    CloseButton(actived: $cardActived)
            }
            .padding(cardActived ? 0 : 15)
            .frame(height: 500)
            .onTapGesture { self.cardActived = true }
            
            !cardActived ? nil :
                CardDetailsView()
                .transition(AnyTransition.move(edge: .bottom))
        }
        .edgesIgnoringSafeArea(cardActived ? .all : .init())
        .statusBar(hidden: cardActived ? true : false)
        .animation(.easeInOut)
    }
}

struct CloseButton: View {
    
    @Binding var actived: Bool
    
    var body: some View {
        
        HStack {
            Spacer()
            VStack {
                Button(action: { self.actived.toggle() }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.trailing, 32)
                        .padding(.top, 64)
                        .shadow(radius: 10)
                })
                Spacer()
            }
        }
    }
}


struct CardDetailsView: View {
    
    var body: some View {
        VStack {
            Text(testBodyString)
                .font(.body)
                .padding()
                .background(Color.white)
                .lineLimit(nil)
            
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("Share Story")
                }.foregroundColor(.blue)
            })
            .padding(.horizontal, 60)
            .padding(.vertical)
            .background(Color.gray.opacity(0.2)).cornerRadius(8)
            .padding(.bottom, 30)
        }
    }
}

struct CardCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardCellView()
    }
}
