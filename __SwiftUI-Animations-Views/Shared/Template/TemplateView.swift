import SwiftUI

struct TemplateView: View {
    var body: some View {
        VStack(spacing: 16) {
            TitleText("This is Title Text")
            SubtitleText("This is Subtitle Text")
            BannerText("This is Banner Text")
        }
    }
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView()
    }
}
