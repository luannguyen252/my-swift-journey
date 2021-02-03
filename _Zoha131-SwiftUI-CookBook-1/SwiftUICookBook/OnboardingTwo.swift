import SwiftUI

struct OnboardingTwo: View {
  @State private var rotateDegree = 0.0
  @State private var screenNumber = 1

  private var imageTwoOffset: CGFloat {
    if screenNumber == 1 {
      return 300
    } else if screenNumber == 2 {
      return 0
    }

    return -300
  }

  private var indicatorAlignment: Alignment {
    if screenNumber == 1 {
      return Alignment.leading
    } else if screenNumber == 2 {
      return Alignment.center
    }

    return Alignment.trailing
  }

  var body: some View {
    VStack {
      ZStack {
        Color.clear // To take all the available space

        Image("OnboardingTwo1")
          .rotationEffect(.degrees(rotateDegree))

        Image("OnboardingTwo2")
          .offset(x: screenNumber == 1 ? 0 : -300)
          .opacity(screenNumber == 1 ? 1 : 0)
          .scaleEffect(screenNumber == 1 ? 1 : 0.5)

        Image("OnboardingTwo3")
          .offset(x: imageTwoOffset)
          .opacity(screenNumber == 2 ? 1 : 0)
          .scaleEffect(screenNumber == 2 ? 1 : 0.5)

        Image("OnboardingTwo4")
          .offset(x: screenNumber == 3 ? 0 : 300)
          .opacity(screenNumber == 3 ? 1 : 0)
          .scaleEffect(screenNumber == 3 ? 1 : 0.5)

      }
      .scaleEffect(1.5)

      ZStack {
        TextContainer(title: "SPORT")
        .offset(x: screenNumber == 1 ? 0 : -300)
        .opacity(screenNumber == 1 ? 1 : 0)

        TextContainer(title: "FASHION")
        .offset(x: imageTwoOffset)
        .opacity(screenNumber == 2 ? 1 : 0)

        TextContainer(title: "TRAVEL")
        .offset(x: screenNumber == 3 ? 0 : 300)
        .opacity(screenNumber == 3 ? 1 : 0)
      }
      .padding(.bottom, 80)

      HStack {
        if screenNumber != 3 {
          ZStack(alignment: indicatorAlignment) {
            HStack {
              ForEach( 0..<3 ){ _ in
                Circle()
                  .fill(Color.gray)
                  .frame(width: 8, height: 8)
              }
            }
            .padding(.horizontal, 4)

            Capsule()
              .fill(Color.pink)
              .frame(width: 14, height: 8)
          }
          .padding(.leading, 32)
          .animation(.default)

          Spacer()
        }

        Button {
          withAnimation{
            rotateDegree += 180
            screenNumber = 1 + screenNumber % 3
          }
        } label: {
          if screenNumber == 3 {
            Text("Get Started")
              .foregroundColor(.white)
          }else {
            Image(systemName: "arrow.forward")
              .foregroundColor(.white)
          }
        }
        .padding()
        .frame(minWidth: 70, maxWidth: screenNumber == 3 ? .infinity : 70)
        .background(
          Capsule()
            .fill(Color.pink)
        )
        .padding(.horizontal, 32)
        .animation(.default)

      }
    }
  }
}

fileprivate struct TextContainer: View{
  let title: String

  var body: some View {
    VStack {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.medium)

      Text("Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
        .padding()
        .multilineTextAlignment(.center)
    }
  }
}

struct OnboardingTwo_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingTwo()
  }
}
