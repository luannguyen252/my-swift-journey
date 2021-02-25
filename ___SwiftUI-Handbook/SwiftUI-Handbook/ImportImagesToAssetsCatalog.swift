import SwiftUI

struct ImportImagesToAssetsCatalog: View {
    var body: some View {
        // Custom Image Asset
        Image("mac1")
        
        // SF Symbols
        Image(systemName: "xmark")
    }
}

#if DEBUG
struct ImportImagesToAssetsCatalog_Previews: PreviewProvider {
    static var previews: some View {
        ImportImagesToAssetsCatalog()
    }
}
#endif
