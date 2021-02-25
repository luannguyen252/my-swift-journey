//
//  Home.swift
//  Signal_ImagePicker (iOS)
//
//  Created by Balaji on 09/02/21.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var message = ""
    
    @StateObject var imagePicker = ImagePickerViewModel()
    
    var body: some View {
       
        NavigationView{
            
            // Sample Signal Chat View...
            
            VStack{
                
                ScrollView{
                }
                
                VStack {
                    
                    HStack(spacing: 15){
                        
                        Button(action: imagePicker.openImagePicker, label: {
                            Image(systemName: imagePicker.showImagePicker ? "xmark" : "plus")
                                .font(.title2)
                                .foregroundColor(.gray)
                        })
                        
                        TextField("New Message", text: $message, onEditingChanged: { (opened) in
                         
                            if opened && imagePicker.showImagePicker{
                                
                                // Closing Picker...
                                imagePicker.showImagePicker.toggle()
                            }
                        })
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                        
                        Button(action: {}, label: {
                            Image(systemName: "camera")
                                .font(.title2)
                                .foregroundColor(.gray)
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "mic")
                                .font(.title2)
                                .foregroundColor(.gray)
                        })
                    }
                    .padding(.horizontal)
                    .padding(.bottom,4)
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        LazyHStack(spacing: 10){
                            
                            // Images...
                            
                            ForEach(imagePicker.fetchedPhotos){photo in
                                
                                Button(action: {
                                    imagePicker.extractPreviewData(asset: photo.asset)
                                    imagePicker.showPreview.toggle()
                                }, label: {
                                    
                                    ThumbnailView(photo: photo)
                                })
                            }
                            
                            // More Or Give Access Button...
                            
                            if imagePicker.library_status == .denied || imagePicker.library_status == .limited{
                                
                                VStack(spacing: 15){
                                    
                                    Text(imagePicker.library_status == .denied ? "Allow Access For Photos" : "Select More Photos" )
                                        .foregroundColor(.gray)
                                    
                                    Button(action: {
                                        // Go to Settings
                                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                                    }, label: {
                                        
                                        Text(imagePicker.library_status == .denied ? "Allow Access" : "Select More")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.vertical,10)
                                            .padding(.horizontal)
                                            .background(Color.blue)
                                            .cornerRadius(5)
                                    })
                                }
                                .frame(width: 150)
                            }
                        }
                        .padding()
                    })
                    // Showing When Button Clicked...
                    .frame(height: imagePicker.showImagePicker ? 200 : 0)
                    .background(Color.primary.opacity(0.04).ignoresSafeArea(.all, edges: .bottom))
                    .opacity(imagePicker.showImagePicker ? 1 : 0)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                // Back Button...
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button(action: {}, label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            
                    })
                }
                
                // Profile...
                
                ToolbarItem(id: "PROFILE", placement: .navigationBarLeading, showsByDefault: true) {
                    
                    HStack(spacing: 8){
                        
                        // Use Your Image Or Profile Image Here...
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 35, height: 35)
                            .overlay(
                            
                                Text("K")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                        
                        Text("Kavsoft")
                            .fontWeight(.semibold)
                        
                        Image(systemName: "person.circle")
                            .font(.caption)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {}, label: {
                        Image(systemName: "camera")
                            .font(.title2)
                            
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {}, label: {
                        Image(systemName: "phone")
                            .font(.title2)
                            
                    })
                }
            }
        }
        // Colors will not work on navigation bar...
        // but use accent color to change...
        .accentColor(.primary)
        .onAppear(perform: imagePicker.setUp)
        .sheet(isPresented: $imagePicker.showPreview, onDismiss: {
            // Clearing Content...
            imagePicker.selectedVideoPreview = nil
            imagePicker.selectedImagePreview = nil
        }, content: {
            
            PreviewView()
                .environmentObject(imagePicker)
        })
    }
}

// Preview View....

struct PreviewView: View {
    
    @EnvironmentObject var imagePicker: ImagePickerViewModel
    
    var body: some View{
        
        // For Top Buttons...
        
        NavigationView{
            
            ZStack{
                
                if imagePicker.selectedVideoPreview != nil{
                    
                    VideoPlayer(player: AVPlayer(playerItem: AVPlayerItem(asset: imagePicker.selectedVideoPreview)))
                }
                
                if imagePicker.selectedImagePreview != nil{
                    
                    Image(uiImage: imagePicker.selectedImagePreview)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
            
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {}, label: {
                        Text("Send")
                    })
                }
            })
        }
    }
}

struct ThumbnailView: View {
    
    var photo: Asset
    
    var body: some View{
        
        ZStack(alignment: .bottomTrailing, content: {
            
            Image(uiImage: photo.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
            
            // If Its Video
            // Displaying Video Icon...
            
            if photo.asset.mediaType == .video{
                Image(systemName: "video.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(8)
            }
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
