import SwiftUI

struct IntroView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                
                Text("This is an app about fitness challanges.")
                    .font(.title)
                    .fontWeight(.bold)

                InfoCell(title: "Test title",
                         subTitle: "Some text that we use the data phom the phone",
                         imageName: "iphone")
                InfoCell(title: "This is a splash screen",
                         subTitle: "something about using the apple watch trainings",
                         imageName: "applewatch.watchface")
                InfoCell(title: "Lightning fast",
                         subTitle: "I hope everything will work as fast as possible..",
                         imageName: "paperplane")
                
                Spacer()

                RoundedNavigationLink("Continue", destination: PrivacyView())
            }
            .padding(.horizontal)
            .navigationTitle("Welcome")
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
