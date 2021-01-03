//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    // Filters
    let availableFilters: [FilterType] = [.Original, .Sepia, .Mono, .Vibrance, .Highlight, .Vignette]
    
    // Show Image Picker
    @State var showImagePicker = false
    
    // Image Controller
    @EnvironmentObject var imageController: ImageController
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    if let imageToDisplay = imageController.displayedImage, let originalImage = imageController.unprocessedImage {
                        // PHOTO
                        Image(uiImage: imageToDisplay)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height*0.75)
                            .clipped()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(availableFilters, id: \.self) { filter in
                                    Button(action: {
                                        imageController.displayedImage = imageController.generateFilteredImage(inputImage: originalImage, filter: filter)
                                    }) {
                                        ThumbnailView(imageToDisplay: imageController.generateFilteredImage(inputImage: originalImage.compressed(), filter: filter)!, width: geometry.size.width*(21/100), height: geometry.size.height*(15/100), filterName: "\(filter)")
                                    }
                                }
                            } //: HSTACK
                        } //: SCROLLVIEW
                        .frame(width: geometry.size.width, height: geometry.size.height*(1/4))
                    } else {
                        Spacer()
                        
                        Text("Upload a photo to start editing.")
                            .frame(width: geometry.size.width, height: geometry.size.height*0.25)
                        
                        Spacer()
                    }
                } //: VSTACK
            } //: GEOMETRY READER
            .navigationBarTitle("Filter App", displayMode: .inline)
            // Navigation Toolbar
            .toolbar(content: {
                // Image Picker Button
                ToolbarItem(placement: .navigationBarLeading) {
                    GalleryButton(showImagePicker: $showImagePicker)
                }
                
                // Save Image Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    SaveButton()
                }
            })
            // Show Image Picker
            .sheet(isPresented: $showImagePicker, content: {
                ImagePicker(imageController: imageController, showImagePicker: $showImagePicker)
            })
        } //: NAVIGATION VIEW
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light).environmentObject(ImageController())
    }
}
#endif

// MARK: - THUMBNAIL VIEW
struct ThumbnailView: View {
    // MARK: - PROPERTIES
    let imageToDisplay: UIImage
    
    let width: CGFloat
    let height: CGFloat
    let filterName: String
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text(filterName)
                .foregroundColor(Color("LightGray"))
            
            Image(uiImage: imageToDisplay)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .cornerRadius(20)
                .clipped()
        } //: VSTACK
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

// MARK: - GALLERY BUTTON
struct GalleryButton: View {
    // MARK: - PROPERTIES
    @Binding var showImagePicker: Bool
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            showImagePicker = true
        }) {
            Image(systemName: "photo")
                .imageScale(.large)
        }
    }
}

// MARK: - SAVE BUTTON
struct SaveButton: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var imageController: ImageController
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            imageController.saveImage()
        }) {
            Image(systemName: "square.and.arrow.down")
                .imageScale(.large)
        }
    }
}
