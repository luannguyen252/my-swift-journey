import SwiftUI

struct CatScene: View {
    var body: some View {
        SceneKitView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct CatScene_Previews: PreviewProvider {
    static var previews: some View {
        CatScene()
    }
}
