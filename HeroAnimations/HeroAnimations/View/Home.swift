//
//  Home.swift
//  HeroAnimations
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    @State var selectedTab = scrollTabs[0]
    @Namespace var animation
    @State var show = false
    @State var selectedBag: BagModel!
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack (spacing: 0) {
                // MARK: - HEADER
                ZStack {
                    HStack(spacing: 16) {
                        Button(action: { }, label: {
                            Image(systemName: "line.horizontal.3.decrease")
                                .font(.title)
                                .foregroundColor(Color("text"))
                        })
                        
                        Spacer(minLength: 0)
                        
                        Button(action: { }, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(Color("text"))
                        })
                        
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                            Button(action: { }, label: {
                                Image(systemName: "cart")
                                    .font(.title)
                                    .foregroundColor(Color("text"))
                            })
                            
                            Circle()
                                .fill(Color("red"))
                                .frame(width: 16, height: 16)
                                .offset(x: 4, y: -4)
                        }) //: ZSTACK
                    } //: HSTACK
                    
                    Text("Bag Store")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("text"))
                } //: ZSTACK
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color("bgHeader"))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5 )
                
                // MARK: - BODY
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack {
                        // MARK: - TITLE
                        HStack {
                            Text("Women")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("text"))
                            
                            Spacer()
                        } //: HSTACK
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom, 8)
                        
                        // MARK: - CATEGORY TABS
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 16) {
                                ForEach(scrollTabs, id: \.self) { tab in
                                    TabButton(title: tab, selectedTab: $selectedTab, animation: animation)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 16)
                        }) //: SCROLLVIEW
                        
                        // MARK: - PRODUCT GRID
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
                            ForEach(bags) { bag in
                                BagView(bagData: bag, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.easeIn) {
                                            selectedBag = bag
                                            show.toggle()
                                        }
                                    }
                            }
                        }
                        .padding()
                        .padding(.top, 16)
                    } //: VSTACK
                })
            } //: VSTACK
            .background(Color("text").opacity(0.05).ignoresSafeArea(.all, edges: .all))
            
            if selectedBag != nil && show {
                DetailView(bagData: $selectedBag, show: $show, animation: animation)
            }
        } //: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - PREVIEW
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
