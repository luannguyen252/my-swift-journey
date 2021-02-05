//
//  ContentView.swift
//  Instafilter
//
//  Created by Sandesh on 20/09/20.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI



struct ContentView: View {
    
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var showingActionSheet = false
    @State private var processedImage: UIImage?
    
    @State private var filter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var body: some View {
        let intsensity = Binding<Double>(
            get: { self.filterIntensity },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        
        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select the image")
                            .foregroundColor(.white)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: intsensity)
                }.padding()
                
                HStack {
                    Button("Change Filter") {
                        self.showingActionSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save") {
                        guard let processedImage = self.processedImage else { return }
                        let imageSaver = ImageSaver()
                        imageSaver.successHandler = { print("Success")}
                        imageSaver.errorHandler = { print("Error: \($0.localizedDescription)") }
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Select a Filter"), buttons: [
                    .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize())},
                    .default(Text("Edges")) { self.setFilter(CIFilter.edges())},
                    .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur())},
                    .default(Text("Pixellate")){ self.setFilter(CIFilter.pixellate())},
                    .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone())},
                    .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask())},
                    .default(Text("Vignette")) { self.setFilter(CIFilter.vignette())},
                    .cancel()
                ])
            }
        }
    }
    
    func loadImage() {
        guard  let inputImage = inputImage else { return }
        let beginImage = CIImage(image: inputImage)
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = filter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            filter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            filter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            filter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        guard let outputImage = filter.outputImage else { return }
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            processedImage = uiImage
            image = Image(uiImage: uiImage)
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        self.filter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
