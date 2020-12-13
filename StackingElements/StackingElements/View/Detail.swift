//
//  Detail.swift
//  StackingElements
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct Detail: View {
    // MARK: - PROPERTIES
    var photo: Photos
    @Binding var show: Bool
    var name: Namespace.ID
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Button(action: {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                }
                .padding(.top, 32)
                
                Spacer(minLength: 0)
                
                Image(photo.image)
                    .resizable()
                    .matchedGeometryEffect(id: photo.image, in: name)
            } //: HSTACK
            .padding(.leading,20)
            .padding([.top,.bottom,.trailing])
            
            // For smaller size phones
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(photo.name)
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.black)
                            
                            Text("3D Illustration")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .opacity(0.6)
                            
                            Text("Free")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding(.top, 10)
                        } //: VSTACK
                        
                        Spacer(minLength: 10)
                        
                        HStack {
                            Text("#")
                                .font(.system(size: 50, weight: .bold))
                                
                            Text("\(photo.place)")
                                .font(.system(size: UIScreen.main.bounds.height < 750 ? 150 : 180, weight: .bold))
                        } //: HSTACK
                        .foregroundColor(Color.gray.opacity(0.7))
                    }
                    .padding(.vertical)

                    Text("\(photo.name) is simply dummy text of the printing and typesetting industry.")
                        .font(.system(size: 16))
                        .foregroundColor(Color.black.opacity(0.8))
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                    
                    HStack(spacing: 15) {
                        Button(action: {}) {
                            Text("Website")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 120)
                                .background(Color("orange"))
                                .clipShape(Capsule())
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "suit.heart.fill")
                                .font(.title)
                                .foregroundColor(Color("orange"))
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 16, x: 8, y: 0)
                        }
                    } //: HSTACK
                    .padding(.top,25)
                    .padding(.bottom)
                }
                .padding(.horizontal,20)
            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .all)
        
    }
}
