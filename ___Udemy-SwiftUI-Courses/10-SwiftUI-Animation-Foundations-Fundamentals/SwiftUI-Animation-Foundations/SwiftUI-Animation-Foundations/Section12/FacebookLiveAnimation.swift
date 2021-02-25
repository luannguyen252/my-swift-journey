import SwiftUI

struct FacebookLiveAnimation: View {
    @State private var swing = false
    @State private var showFirstComment = false
    @State private var showSecondComment = false
    @State private var hideComment = false
    @State private var changeSky = false
    
    var body: some View {
        VStack(spacing: 32) {
            HStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 64, height: 32, alignment: .center)
                    .foregroundColor(Color("red"))
                    .overlay(Text("LIVE"))
                
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 84, height: 32, alignment: .center)
                    .foregroundColor(Color("light").opacity(0.1))
                    .overlay(Label("9.9k", systemImage: "eye.fill"))

                Spacer()
                
                Text("")
                    .font(.system(.headline))
                    .foregroundColor(Color(.systemBlue)) + Text(Date().addingTimeInterval(.leastNormalMagnitude), style: .date)
                    .font(.caption)
                
                Text("")
                    .font(.system(.headline))
                    .foregroundColor(Color(.systemBlue)) + Text(Date().addingTimeInterval(.leastNonzeroMagnitude), style: .time)
                    .font(.caption)
            }
            .padding(.horizontal)
            
            ZStack {
                Image("photo")
                    .hueRotation(.degrees(changeSky ? -120 : 60))
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear()
                    {
                        changeSky.toggle()
                    }
                
                Image("kid")
                    .rotation3DEffect(
                        .degrees(swing ? 25 : -5),
                        axis: (x: 1, y: 0, z: 0), anchor: .top)
                    .offset(y: -30)
                    .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear()
                    {
                        swing.toggle()
                    }

                VStack {
                    Spacer()
                    
                    HStack {
                        MovingComments()
                            .offset(y: showFirstComment ? 180 : 250)
                            .onAppear() {
                                withAnimation(Animation.easeInOut(duration: 0.2)) {
                                   showFirstComment.toggle()
                               }
                           }

                        Spacer()
                    }
                    .padding(.horizontal)
                    .opacity(hideComment ? 0 : 1)
                    .onAppear() {
                        withAnimation(Animation.easeInOut(duration: 1).delay(6)) {
                            hideComment.toggle()
                       }
                   }
                }
                .scaleEffect(1, anchor: .top)
                
                .offset(y: showSecondComment ? -400 : -50)
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 2).delay(3)) {
                        showSecondComment.toggle()
                    }
                }
            }
            .frame(width: 400, height: 350)
            .clipShape(Rectangle())
            
            Comments()
        }
    }
}

#if DEBUG
struct FacebookLiveAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FacebookLiveAnimation()
            .preferredColorScheme(.dark)
    }
}
#endif
