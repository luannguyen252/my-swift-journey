// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct CameraButtonView: View {

    @State var recording = false
    var action: ((_ recording: Bool) -> Void)?

    var body: some View {

        ZStack {
            Circle()
                .stroke(lineWidth: 6)
                .foregroundColor(.white)
                .frame(width: 65, height: 65)

            RoundedRectangle(cornerRadius: recording ? 8 : self.innerCircleWidth / 2)
                .foregroundColor(.white)
                .frame(width: self.innerCircleWidth, height: self.innerCircleWidth)

        }
        .animation(.linear(duration: 0.2))
        .padding(20)
        .onTapGesture {
            withAnimation {
                self.recording.toggle()
                self.action?(self.recording)
            }
        }

    }

    var innerCircleWidth: CGFloat {
        self.recording ? 32 : 55
    }
}

struct CameraButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {

            CameraButtonView(recording: false)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("not recording")
                .background(Color.gray)

            CameraButtonView(recording: true)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("recording")
                .background(Color.gray)

            ZStack {
                Image("turtlerock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack {
                    Spacer()
                    CameraButtonView()
                }
            }
        }
    }
}
