import SwiftUI
import MapKit

struct FavoriteRow : View {
    var favorite: Favorite
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(favorite.name)
                .font(.headline)
            Text("\(favorite.coordinate.latitude), \(favorite.coordinate.longitude)")
                .font(.subheadline)
        }
        .padding(.leading)
    }
}

#if DEBUG
struct FavoriteRow_Previews : PreviewProvider {
    static var previews: some View {
        FavoriteRow(favorite: Favorite(id: 0, coordinate: Coordinate(latitude: 21.028511, longitude: 105.804817), name: "RIT"))
            .previewLayout(.sizeThatFits)
    }
}
#endif
