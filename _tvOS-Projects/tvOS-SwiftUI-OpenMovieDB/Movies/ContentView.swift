import SwiftUI
import Combine
import Hover
import KingfisherSwiftUI
import struct Kingfisher.ResizingImageProcessor

struct MovieSection: View {
  let title: String
  let movies: [Movie]
  
  @Binding var presentingMovie: Movie?
  
  var body: some View {
    VStack {
      Text(title)
        .font(.largeTitle)
        .padding()
      
      ScrollView(.horizontal) {
        LazyHStack(spacing: 0) {
          ForEach(movies) { movie in
            Button(action: { presentingMovie = movie }) {
              MovieCard(movie: movie)
            }
            .buttonStyle(CardButtonStyle())
            .padding(75)
          }
        }
        .padding(-40)
      }
    }
    .listRowInsets(.init())
    .listRowBackground(Color.clear)
  }
}

struct ContentView: View {
  @ObservedObject var viewModel: ViewModel = .init()
  @State var presentingMovie: Movie? = nil
  
  var body: some View {
    List {
      MovieSection(title: "Star Wars Movies", movies: viewModel.starwars, presentingMovie: $presentingMovie)
        
      MovieSection(title: "Marvel Movies", movies: viewModel.marvel, presentingMovie: $presentingMovie)
      
      MovieSection(title: "Star Wars Movies", movies: viewModel.starwars, presentingMovie: $presentingMovie)
      
      MovieSection(title: "Marvel Movies", movies: viewModel.marvel, presentingMovie: $presentingMovie)
      
      MovieSection(title: "Star Wars Movies", movies: viewModel.starwars, presentingMovie: $presentingMovie)
      
      MovieSection(title: "Marvel Movies", movies: viewModel.marvel, presentingMovie: $presentingMovie)
      
      MovieSection(title: "Star Wars Movies", movies: viewModel.starwars, presentingMovie: $presentingMovie)
      
      MovieSection(title: "Marvel Movies", movies: viewModel.marvel, presentingMovie: $presentingMovie)
    }
    .sheet(item: $presentingMovie, onDismiss: { presentingMovie = nil }) { movie in
      VStack {
        Text(movie.Title).font(.largeTitle)
      }
    }
  }
}

struct MovieCard: View {
  let movie: Movie
  
  private let processor = ResizingImageProcessor(referenceSize: .init(width: 500, height: 500), mode: .aspectFill)

  var body: some View {
    ZStack {
      KFImage(movie.posterUrl, options: [.processor(processor)])
        .resizable()
        .frame(width: 500, height: 500)
        .scaledToFill()
        .clipped()
      VStack {
        Spacer()
        Text(movie.Title).font(.headline)
          .lineLimit(1)
      }
      .frame(maxWidth: 500)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

extension ContentView {
  final class ViewModel: ObservableObject {
    
    @Published var starwars: [Movie] = []
    @Published var marvel: [Movie] = []
    private let provider = Hover()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
      fetchStarwars()
      fetchMarvel()
    }
    
    func fetchStarwars() {
      provider
        .request(
          with: MovieTarget.search(title: "star"),
          scheduler: RunLoop.main,
          class: SearchResponse.self
        )
        .replaceError(with: .init(Search: []))
        .map { $0.Search }
        .assign(to: \.starwars, on: self)
        .store(in: &subscriptions)
    }
    
    func fetchMarvel() {
      provider
        .request(
          with: MovieTarget.search(title: "marvel"),
          scheduler: RunLoop.main,
          class: SearchResponse.self
        )
        .replaceError(with: .init(Search: []))
        .map { $0.Search }
        .assign(to: \.marvel, on: self)
        .store(in: &subscriptions)
    }
  }
}

struct SearchResponse: Codable {
  let Search: [Movie]
}
