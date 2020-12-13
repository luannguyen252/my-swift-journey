//
//  DetailView.swift
//  HeroAnimations
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    @Binding var bagData: BagModel!
    @Binding var show: Bool
    var animation: Namespace.ID
    @State var selectedColor = Color.red
    @State var count = 0
    @State var isSmallDevice = UIScreen.main.bounds.height < 750

    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - HEADER
            HStack {
                VStack(alignment: .leading,spacing: 5) {
                    Button(action: {
                        withAnimation(.easeOut) { show.toggle() }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Text("Hand Bag")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    Text(bagData.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                } //: VSTACK
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                }
            } //: HSTACK
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)

            // MARK: - PRODUCT IMAGE
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Price")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(bagData.price)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                
                Image(bagData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    // MARK: - HERO ANIMATION
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            } //: HSTACK
            .padding()
            .padding(.top,10)
            .zIndex(1)

            // MARK: - CONTENT
            VStack {
                ScrollView(isSmallDevice ? .vertical : .init(), showsIndicators: false) {
                    // MARK: - COLOR AND SIZE
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Color")
                                .fontWeight(.bold)
                                .foregroundColor(Color("text").opacity(0.6))
                            
                            HStack(spacing: 15) {
                                ColorButton(color: Color(bagData.image), selectedColor: $selectedColor)
                                
                                ColorButton(color: Color.yellow, selectedColor: $selectedColor)
                                
                                ColorButton(color: Color.green, selectedColor: $selectedColor)
                            } //: HSTACK
                        } //: VSTACK
                        
                        Spacer(minLength: 0)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Size")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("text").opacity(0.6))
                            
                            Text("12 cm")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("text"))
                        } //: VSTACK
                    } //: HSTACK
                    .padding(.horizontal)

                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding()

                    // MARK: - QUANTITY BUTTONS
                    HStack(spacing: 20) {
                        //: MINUS BUTTON
                        Button(action: {
                            if count > 0 {
                                count -= 1
                            }
                        }) {
                            Image(systemName: "minus")
                                .font(.title2)
                                .foregroundColor(Color("text").opacity(0.6))
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        }

                        //: QUANTITY
                        Text("\(count)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("text"))

                        //: PLUS BUTTON
                        Button(action: {
                            count += 1
                        }) {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(Color("text").opacity(0.6))
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        }

                        Spacer()

                        // MARK: - FAVOURITE BUTTON
                        Button(action: {}) {
                            Image(systemName: "suit.heart.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color("favourite"))
                                .clipShape(Circle())
                        }
                    } //: HSTACK
                    .padding(.horizontal)

                    Spacer(minLength: 0)

                    // MARK: - PRIMARY BUTTON
                    Button(action: {}) {
                        Text("BUY NOW")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color(bagData.image))
                            .clipShape(Capsule())
                    }
                    .padding(.top)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
                }
                .padding(.top, isSmallDevice ? 0 : -20)
            } //: VSTACK
            .background(Color("bgDetail")
                            .clipShape(CustomCorner())
                            .padding(.top,isSmallDevice ? -60 : -120)
            )
            .zIndex(0)
        } //: VSTACK
        .background(Color(bagData.image).ignoresSafeArea(.all, edges: .top))
        .background(Color("bgDetail").ignoresSafeArea(.all, edges: .bottom))
        .onAppear {
            // First color is image or bag color
            selectedColor = Color(bagData.image)
        }
    }
}
