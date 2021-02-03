import SwiftUI

struct OnboardingOne: View {
  @State private var currentPage = 1
  @State private var backGroundState = 0

  private let indicatorSize: CGFloat = 8

  private var currentColor: Color {
    switch currentPage {
    case 1: return Color(UIColor.systemRed).opacity(0.75)
    case 2: return Color(red: 219/255, green: 189/255, blue: 102/255)
    default: return Color(red: 79/255, green: 80/255, blue: 217/255)
    }
  }

  private var firstOffset: CGFloat {
    switch currentPage {
    case 1: return 0
    default: return -UIScreen.main.bounds.width
    }
  }

  private var secondOffset: CGFloat {
    switch currentPage {
    case 1: return UIScreen.main.bounds.width
    case 2: return 0
    default: return -UIScreen.main.bounds.width
    }
  }

  private var thirdOffset: CGFloat {
    switch currentPage {
    case 3: return 0
    default: return UIScreen.main.bounds.width
    }
  }

  private var backGroundDegree: Double {
    switch backGroundState {
    case 1: return 60
    case -1: return 30
    default: return 45
    }
  }

  var body: some View {
    ZStack {
      ZStack { currentColor }
      .animation(.easeIn)
      .edgesIgnoringSafeArea(.all)

      RoundedRectangle(cornerRadius: 25)
        .frame(width: .infinity, height: .infinity)
        .foregroundColor(.white)
        .rotationEffect(.degrees(backGroundDegree))
        .scaleEffect(3.3)
        .offset(x: 450, y: -1340)
        .animation(.spring(blendDuration: 0.5))

      VStack{
        ZStack {
          Color.clear

          OnboardingOneContent(
            imageName: "OnBoardingOne1",
            title: "Learning for children",
            message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
          )
          .offset(x: firstOffset)
          .animation(.easeInOut)

          OnboardingOneContent(
            imageName: "OnBoardingOne2",
            title: "Scholarship Giveway",
            message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
          )
          .offset(x: secondOffset)
          .animation(.easeInOut)

          OnboardingOneContent(
            imageName: "OnBoardingOne3",
            title: "Education Achievement",
            message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
          )
          .offset(x: thirdOffset)
          .animation(.easeInOut)
        }
        .padding(.all, 32)

        HStack(spacing: 18) {
          Button(action: {}){
            Text("Log in")
              .foregroundColor(currentColor)
              .frame(maxWidth: .infinity, minHeight: 60)
              .background(
                RoundedRectangle(cornerRadius: 12)
                  .foregroundColor(.white)
              )
              .animation(.easeInOut)
          }

          Button(action: {}){
            Text("Create account")
              .foregroundColor(currentColor)
              .frame(maxWidth: .infinity, minHeight: 60)
              .background(
                RoundedRectangle(cornerRadius: 12)
                  .foregroundColor(.white)
              )
              .animation(.easeInOut)
          }
        }
        .padding(.all, 32)

        HStack {
          Button {
            if currentPage > 1 {
              currentPage -= 1
              startToggleAnimation(forward: false)
            }
          } label: {
            Text("Back")
              .foregroundColor(.white)
          }

          Spacer()

          Circle()
            .frame(width: indicatorSize, height: indicatorSize)
            .foregroundColor(.white)
            .opacity(currentPage == 1 ? 1 : 0.55)
            .animation(.easeIn)

          Circle()
            .frame(width: indicatorSize, height: indicatorSize)
            .foregroundColor(.white)
            .opacity(currentPage == 2 ? 1 : 0.55)
            .animation(.easeIn)

          Circle()
            .frame(width: indicatorSize, height: indicatorSize)
            .foregroundColor(.white)
            .opacity(currentPage == 3 ? 1 : 0.55)
            .animation(.easeIn)

          Spacer()

          Button {
            if currentPage < 3 {
              currentPage += 1
              startToggleAnimation(forward: true)
            }
          } label: {
            Text("Next")
              .foregroundColor(.white)
          }
        }
        .padding(.horizontal, 32)
      }
    }
  }

  func startToggleAnimation(forward isForward: Bool) {
    if isForward {
      backGroundState = 1
    } else {
      backGroundState = -1
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      backGroundState = 0
    }
  }
}

fileprivate struct OnboardingOneContent: View {
  let imageName: String
  let title: String
  let message: String

  var body: some View {
    VStack() {
      Image(imageName)
        .resizable()
        .scaledToFit()
        .frame(height: 250)

      Spacer()

      Text(title)
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom)

      Text(message)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

struct OnboardingOne_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingOne()
  }
}
