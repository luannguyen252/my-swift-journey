//
//  Home.swift
//  PhotoMacApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    // Getting Window Size
    var window = NSScreen.main?.visibleFrame
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 4)
    @State var search = ""
    @StateObject var imageData = ImageViewModel()
    
    // MARK: - BODY
    var body: some View {
        HStack {
            // MARK: - SIDEBAR
            SideBar()
            VStack {
                HStack(spacing: 12) {
                    // MARK: - SEARCH BAR
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search", text: $search)
                            .textFieldStyle(PlainTextFieldStyle())
                    } //: HSTACK
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(BlurWindow())
                    .cornerRadius(10)
                    
                    Button(action: {}, label: {
                        Image(systemName: "slider.vertical.3")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    }) //: BUTTON
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black)
                            .cornerRadius(10)
                    }) //: BUTTON
                    .buttonStyle(PlainButtonStyle())
                } //: HSTACK

                //MARK: - SCROLLVIEW WITH IMAGES
                GeometryReader { reader in
                    ScrollView {
                        LazyVGrid(columns: columns,spacing: 15 ,content: {
                            // Getting Images
                            ForEach(imageData.images.indices, id: \.self) { index in
                                ZStack {
                                    WebImage(url: URL(string: imageData.images[index].download_url)!)
                                        .placeholder(content: {
                                            ProgressView()
                                        })
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: (reader.frame(in: .global).width - 45) / 4, height: 150)
                                        .cornerRadius(15)
                                    
                                    Color.black.opacity(imageData.images[index].onHover ?? false ? 0.2 : 0)
                                        .cornerRadius(15)
                                    
                                    VStack {
                                        HStack {
                                            Spacer(minLength: 0)

                                            Button(action: {}, label: {
                                                Image(systemName: "hand.thumbsup.fill")
                                                    .foregroundColor(.yellow)
                                                    .padding(8)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                                            })
                                            .buttonStyle(PlainButtonStyle())

                                            Button(action: {saveImage(index: index)}, label: {
                                                
                                                Image(systemName: "folder.fill")
                                                    .foregroundColor(.blue)
                                                    .padding(8)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                                            })
                                            .buttonStyle(PlainButtonStyle())
                                        } //: HSTACK
                                        .padding(10)

                                        Spacer()
                                    } //: VSTACK
                                    .opacity(imageData.images[index].onHover ?? false ? 1 : 0)
                                } //: ZSTACK
                                // Hover...
                                .onHover(perform: { hovering in
                                    withAnimation {
                                        imageData.images[index].onHover = hovering
                                    }
                                }
                            )}
                        }) //: LAZYVGRID
                        .padding(.vertical)
                    } //: SCROLLVIEW
                } //: GEOMETRY READER
                Spacer()
            } //: VSTACK
            .padding()
        } //: HSTACK
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: window!.width / 1.5, height: window!.height - 40)
        .background(Color.white.opacity(0.6))
        .background(BlurWindow())
    }
    
    // MARK: - SAVE IMAGE
    func saveImage(index: Int) {
        // Getting image data from url
        let manager = SDWebImageDownloader(config: .default)
        
        manager.downloadImage(with: URL(string: imageData.images[index].download_url)!) { (image, _, _, _) in
            guard let imageoriginal = image else{return}
            let data = imageoriginal.sd_imageData(as: .JPEG)

            // Saving image
            let pannel = NSSavePanel()
            pannel.canCreateDirectories = true
            pannel.nameFieldStringValue = "\(imageData.images[index].id).jpg"

            pannel.begin { (response) in
                if response.rawValue == NSApplication.ModalResponse.OK.rawValue {
                    do {
                        try data?.write(to: pannel.url!, options: .atomicWrite)
                        print("success")
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
