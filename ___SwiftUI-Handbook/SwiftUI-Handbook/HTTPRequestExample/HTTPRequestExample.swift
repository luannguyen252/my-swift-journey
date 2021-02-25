import SwiftUI

/// https://engineering.nodesagency.com/categories/ios/2020/03/16/Combine-networking-with-a-hint-of-swiftUI
/// https://developers.themoviedb.org/3

// HTTP Request Example
struct HTTPRequestExample: View {
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        List(viewModel.movies) { movie in
            HStack {
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.originalTitle)
                        .font(.subheadline)
                }
            }
        }
    }
}

#if DEBUG
struct HTTPRequestExample_Previews: PreviewProvider {
    static var previews: some View {
        HTTPRequestExample()
    }
}
#endif
