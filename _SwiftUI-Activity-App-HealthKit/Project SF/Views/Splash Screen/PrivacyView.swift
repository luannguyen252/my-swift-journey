import SwiftUI

struct PrivacyView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Text("We value your privacy.")
                .font(.title)
                .fontWeight(.bold)

            InfoCell(title: "Sharing",
                     subTitle: "We don't share your data with other companies",
                     imageName: "square.and.arrow.up.on.square")
            InfoCell(title: "This is a splash screen",
                     subTitle: "something about using the apple watch trainings",
                     imageName: "applewatch.watchface")
            InfoCell(title: "Test",
                     subTitle: "idk maybe something else",
                     imageName: "pencil")
            
            Spacer()

            RoundedNavigationLink("Continue", destination: Text("asd"))
        }
        .padding(.horizontal)
        .navigationTitle("Privacy")
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
