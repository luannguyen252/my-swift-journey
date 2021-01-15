import SwiftUI
import Combine

final class SelectedCell: ObservableObject {
    @Published
    var coordinate: Coordinate?
}
