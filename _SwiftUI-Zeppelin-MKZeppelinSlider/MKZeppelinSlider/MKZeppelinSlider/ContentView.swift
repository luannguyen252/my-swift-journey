import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 10
    @State var showItems: Bool = false

    let showItemsDuration: Double = 1.5
    private let mainCloudHeight: CGFloat = 160

    var transition: AnyTransition {
        AnyTransition
            .move(edge: .top)
            .combined(with: .opacity)
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.zPink
                Group {
                    if self.showItems {
                        HStack(spacing: 0) {
                            MKTitleView(appearingDelay: self.showItemsDuration * 0.9)
                            Spacer()
                            MKCloudView(sliderValue: self.$sliderValue, sliderMaxValue: 20).layoutPriority(1)
                        }
                        .transition(self.transition)
                        .offset(y: -100)
                    }

                    MKZeppelinSliderView(animationValue: self.$sliderValue.animation(), airshipAppearingDelay: self.showItemsDuration * 0.9)
                        .offset(y: self.showItems ? 200 : 0)
                        .padding(.leading, 50)
                        .padding(.trailing, 100)
                }
                .padding(EdgeInsets(top: self.showItems ?  proxy.size.height * 0.2 : 0,
                                    leading: proxy.size.width * 0.15,
                                    bottom: proxy.size.height * 0.3,
                                    trailing: 20))

            }
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear() {
            withAnimation(.linear(duration: self.showItemsDuration)) {
                self.showItems.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
