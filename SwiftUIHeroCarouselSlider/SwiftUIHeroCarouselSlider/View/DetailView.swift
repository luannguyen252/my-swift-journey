//
//  DetailView.swift
//  SwiftUIHeroCarouselSlider
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model: CarouselViewModel
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            VStack {
                Text("Thursday 31 December")
                    .font(.caption)
                    .foregroundColor(Color.white.opacity(0.85))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 32)
                    .matchedGeometryEffect(id: "Date-\(model.selectedCard.id)", in: animation)
                
                HStack {
                    Text(model.selectedCard.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .frame(width: 320, alignment: .leading)
                        .padding()
                        .matchedGeometryEffect(id: "Title-\(model.selectedCard.id)", in: animation)
                    
                    Spacer(minLength: 0)
                } //: HSTACK
                
                // Detail Text Content
                // Showing content Some Delay For Better Animation
                if model.showContent {
                    Text(model.content)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .padding()
                        .animation(.easeIn)
                }
                
                Spacer(minLength: 0)
            } //: VSTACK
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                model.selectedCard.cardColor
                    .cornerRadius(25)
                    .matchedGeometryEffect(id: "bgColor-\(model.selectedCard.id)", in: animation)
                    .ignoresSafeArea(.all, edges: .bottom)
            )
            
            // Close Button
            VStack {
                Spacer()
                
                if model.showContent {
                    Button(action: CloseView, label: {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                            .padding(5)
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })
                    .padding(.bottom)
                }
            } //: VSTACK
        } //: ZSTACK
        .edgesIgnoringSafeArea(.top)
        .statusBar(hidden: true)
    }
    
    // MARK: - CLOSE VIEW
    func CloseView() {
        withAnimation(.spring()) {
            model.showCard.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeIn) {
                    model.showContent = false
                }
            }
        }
    }
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
