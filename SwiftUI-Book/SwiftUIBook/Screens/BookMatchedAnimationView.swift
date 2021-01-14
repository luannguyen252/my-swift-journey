import SwiftUI

struct BookMatchedAnimationView: BookView {

  @State var shows: Bool = false

  @Namespace var foo

  var body: some View {

    VStack {
      Button {
        withAnimation {
          shows.toggle()
        }
      } label: {
        Text("button")
      }
      __ContentView()
    }
  }
}

fileprivate struct __ContentView: View {
  @Namespace private var animation
  @State private var isZoomed = false

  var body: some View {
    VStack {
      Spacer()

      VStack {
        HStack {

          if isZoomed {

            RoundedRectangle(cornerRadius: 10)
              .fill(Color.red)
              .matchedGeometryEffect(id: "AlbumCover", in: animation)
              .frame(width: 300, height: 300)
              .padding(.top, 20)

          } else {

            RoundedRectangle(cornerRadius: 10)
              .fill(Color.blue)
              .matchedGeometryEffect(id: "AlbumCover", in: animation)
              .frame(width: 44, height: 44)
              .padding(.top, 0)

            Text("Taylor Swift – 1989")
              .font(Font.system(size: 44).bold())
              .matchedGeometryEffect(id: "AlbumTitle", in: animation)

            Spacer()
          }
        }

        if isZoomed == true {

          Text("Taylor Swift – 1989")
            .font(Font.system(size: 28).bold())
            .matchedGeometryEffect(id: "AlbumTitle", in: animation)
            .padding(.bottom, 60)
          Spacer()

        }
      }
      .onTapGesture {
        withAnimation(.spring()) {
          self.isZoomed.toggle()
        }
      }
      .padding()
      .frame(maxWidth: .infinity)
      .frame(height: isZoomed ? 400 : 60)
      .background(Color(white: 0.9))
    }
  }
}
