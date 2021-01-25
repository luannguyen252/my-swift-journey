//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SwiftyHUDView
import SwURL
import SwiftUI
import Combine
import Foundation

struct ImageListView : View {

    // MARK: Properties

    @ObservedObject var viewModel = ImageListViewModel(pixaBayService: PixaBayService())
    @State private var searchTerm: String = ""

    // MARK: APIs

    var body: some View {
        SwiftyHUDView(isShowing: $viewModel.isActive) {
            NavigationView {
                VStack {
                    HStack {
                        TextField(
                            "TextField",
                            text: self.$searchTerm)

                        Button(action: {
                            self.viewModel.isActive = true
                            self.viewModel.search(withTerm: self.searchTerm)
                        }) {
                            Text("Search")
                        }
                    }
                    .padding(EdgeInsets(top: 8.0, leading: 16.0, bottom: 8.0, trailing: 16.0))

                    List {
                        ForEach(self.viewModel.images, id: \.id) { image in
                            ImageCell(image: image)
                        }
                    }
                }

                .navigationBarTitle("Images")
            }
        }
    }
}

struct ImageCell: View {
    var image: ImageModel
    var body: some View {
        NavigationLink(destination: ImageDetailView(image: image)) {
            HStack {
                RemoteImageView
                    .init(url: URL(string: image.previewURL)!, placeholderImage: Image.init(systemName: "icloud.and.arrow.down"))
                    .frame(width: 30, height: 30, alignment: Alignment.center)
                    .clipShape(Ellipse().size(width: 30, height: 30))
                    .scaledToFit()
                Text(image.previewURL)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        let viewModel = ImageListViewModel(pixaBayService: PixaBayService())
        var view = ImageListView()
        view.viewModel = viewModel
        return view
    }
}
#endif
