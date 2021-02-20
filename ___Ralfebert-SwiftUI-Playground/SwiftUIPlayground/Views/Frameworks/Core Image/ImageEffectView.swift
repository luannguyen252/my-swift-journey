// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import Combine
import CoreImage
import CoreImage.CIFilterBuiltins
import ImagePickerView
import SwiftUI

/// see https://stackoverflow.com/questions/61929273/core-image-photo-effect-react-change-slowly-in-real-iphone-when-changing-intens/61930650#61930650
class ImageEffect: ObservableObject {

    @Published var filterIntensity = 0.5
    @Published var inputImage: UIImage?
    @Published var outputImage: UIImage?

    @Published var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    var subscriptions = Set<AnyCancellable>()
    let queue = DispatchQueue(label: "Image processing")

    init() {
        self.$inputImage
            .map { inputImage -> CIImage? in
                guard let inputImage = inputImage else { return nil }
                return CIImage(image: inputImage)
            }
            .combineLatest(self.$filterIntensity)
            .debounce(for: .milliseconds(50), scheduler: self.queue)
            .map { inputImage, filterIntensity -> UIImage? in
                guard let inputImage = inputImage else { return nil }

                self.currentFilter.inputImage = inputImage
                self.currentFilter.intensity = Float(filterIntensity)

                guard let outputImage = self.currentFilter.outputImage else { return nil }

                guard let cgImage = self.context.createCGImage(outputImage, from: outputImage.extent) else { return nil }

                return UIImage(cgImage: cgImage)

            }
            .receive(on: RunLoop.main)
            .sink { image in
                self.outputImage = image
            }
            .store(in: &self.subscriptions)
    }

}

struct ImageEffectView: View {

    @ObservedObject var imageEffect = ImageEffect()
    @State private var showingImagePicker = false

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)

                    if imageEffect.outputImage != nil {
                        Image(uiImage: imageEffect.outputImage!)
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }

                HStack {
                    Text("Intensity")
                    Slider(value: $imageEffect.filterIntensity)
                }
                .padding(.vertical)

            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker) {
                ImagePickerView(sourceType: .photoLibrary) { image in
                    self.imageEffect.inputImage = image
                }
            }
        }
    }

}

struct ImageEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ImageEffectView()
    }
}
