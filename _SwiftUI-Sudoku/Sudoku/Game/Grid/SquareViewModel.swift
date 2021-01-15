import SwiftUI

struct SquareViewModel: ViewModel {

    let rowIndices = [0, 1, 2]
    var borderWidth: CGFloat {
        screenHeight > 667 ? 3 : 2
    }
}
