import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = [] // 1
    var cancellationToken: AnyCancellable? // 2
    
    init() {
        getMovies() // 3
    }
}

extension MovieViewModel {
    // Subscriber implementation
    func getMovies() {
        cancellationToken = MovieDB.request(.trendingMoviesWeekly) // 4
            .mapError({ (error) -> Error in // 5
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, // 6
                  receiveValue: {
                    self.movies = $0.movies // 7
            })
    }
}
