//
//  Home.swift
//  Filter
//
//  Created by Balaji on 30/09/20.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        
        VStack{
            
            if !homeData.allImages.isEmpty && homeData.mainView != nil{
                
                Spacer(minLength: 0)
                
                Image(uiImage: homeData.mainView.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                
                Slider(value: $homeData.value)
                    .padding()
                    .opacity(homeData.mainView.isEditable ? 1 : 0)
                    .disabled(homeData.mainView.isEditable ? false : true)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 20){
                        
                        ForEach(homeData.allImages){filtered in
                            
                            Image(uiImage: filtered.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                            // Updating ManView...
                            // WhenEver Button Tapped...
                                .onTapGesture {
                                    // clearing old data...
                                    homeData.value = 1.0
                                    homeData.mainView = filtered
                                }
                        }
                    }
                    .padding()
                }
            }
            else if homeData.imageData.count == 0{
                Text("Pick An Image To Process !!!")
            }
            else{
                // Loading View...
                ProgressView()
            }
        }
        .onChange(of: homeData.value, perform: { (_) in
            homeData.updateEffect()
        })
        .onChange(of: homeData.imageData, perform: { (_) in
            // When Ever image is changed Firing loadImage...
            
            // clearing exisiting data...
            homeData.allImages.removeAll()
            homeData.mainView = nil
            homeData.loadFilter()
        })
        .toolbar {
            
            // Image Button...
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button(action: {homeData.imagePicker.toggle()}) {
                    
                    Image(systemName: "photo")
                        .font(.title2)
                }
            }
            
            // Saving Image....
            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button(action: {
                    UIImageWriteToSavedPhotosAlbum(homeData.mainView.image, nil, nil, nil)
                }) {
                    
                    Image(systemName: "square.and.arrow.up.fill")
                        .font(.title2)
                }
                // disabling on no Image...
                .disabled(homeData.mainView == nil ? true : false)
            }
        }
        .sheet(isPresented: $homeData.imagePicker) {
            
            ImagePicker(picker: $homeData.imagePicker, imageData: $homeData.imageData)
        }
    }
}

