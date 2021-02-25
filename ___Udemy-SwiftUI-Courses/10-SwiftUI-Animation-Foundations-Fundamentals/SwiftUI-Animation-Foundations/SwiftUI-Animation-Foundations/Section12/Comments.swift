import SwiftUI

struct Comments: View {
    @State private var thumbComment = false
    @State private var heartComment = false
    @State private var heart2Comment = false
    @State private var thumb2Comment = false
    @State private var smillingComment = false
    @State private var smilling2Comment = false
    @State private var comment: String = "Write a comment..."
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chevron.down")
                Text(" Comments - 5.5k")
            }
            
            HStack {
                Image(systemName: "arrowshape.turn.up.right.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color("blue"))

                RoundedRectangle(cornerRadius: 22)
                    .stroke()
                    .frame(width: 230, height: 37, alignment: .center)
                    .overlay(
                        HStack {
                            TextField("", text: $comment)
                            Image(systemName: "paperplane")
                                .foregroundColor(Color("blue"))
                        }
                        .padding(.horizontal)
                )
                
                Spacer()
                
                ZStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.title)
                        .foregroundColor(Color("blue"))
                        .scaleEffect(thumbComment ? 0 : 1, anchor: thumbComment ? .bottomLeading: .bottomTrailing)
                        .offset(y: thumbComment ? -400 : 0)
                        .rotationEffect(.degrees(thumbComment ? 15 : -30))
                        .animation(Animation.easeIn(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            thumbComment.toggle()
                        }

                    Image(systemName: "hand.thumbsup.fill")
                        .font(.title)
                        .foregroundColor(Color("blue"))
                        .scaleEffect(thumb2Comment ? 0 : 1, anchor: thumb2Comment ? .bottomLeading: .bottomTrailing)
                        .offset(y: thumb2Comment ? -400 : 0)
                        .rotationEffect(.degrees(thumb2Comment ? -7.5 : 15))
                        .animation(Animation.easeOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            thumb2Comment.toggle()
                        }

                    Image("smiling")
                        .foregroundColor(Color("blue"))
                        .scaleEffect(smillingComment ? 0 : 1.25, anchor: smillingComment ? .bottomLeading: .bottomTrailing)
                        .offset(y: smillingComment ? -400 : 0)
                        //.rotationEffect(.degrees(smillingComment ? -7.5 : 15))
                        .animation(Animation.easeIn(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            smillingComment.toggle()
                        }
                    
                    Image("smiling")
                        .foregroundColor(Color("blue"))
                        .scaleEffect(smilling2Comment ? 0 : 1.25, anchor: smilling2Comment ? .bottomLeading: .bottomTrailing)
                        .offset(y: smilling2Comment ? -400 : 0)
                        //.rotationEffect(.degrees(smillingComment ? -7.5 : 15))
                        .animation(Animation.easeOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            smilling2Comment.toggle()
                        }
                    
                    RoundedRectangle(cornerRadius: 18)
                        .frame(width: 36, height: 36, alignment: .center)
                        .foregroundColor(Color("blue"))
                        .overlay(Image(systemName: "hand.thumbsup.fill")
                    )
                }
                
                ZStack {
                    Image(systemName: "heart.fill")
                        .font(.title)
                        .foregroundColor(Color("pink"))
                        .scaleEffect( heartComment ? 0 : 1, anchor:  heartComment ? .bottomLeading: .bottomTrailing)
                        .offset(y:  heartComment ? -400 : 0)
                        .rotationEffect(.degrees(heartComment ? -15 : 15))
                        .animation(Animation.easeOut(duration: 4).delay(1.1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            heartComment.toggle()
                        }
                    
                    Image(systemName: "heart.fill")
                        .font(.title)
                        .foregroundColor(Color(.systemPink))
                        .scaleEffect( heart2Comment ? 0 : 1, anchor:  heart2Comment ? .bottomLeading: .bottomTrailing)
                        .offset(y:  heart2Comment ? -400 : 0)
                        .rotationEffect(.degrees(heart2Comment ? 15 : -15))
                        .animation(Animation.easeInOut(duration: 4).delay(1.1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            heart2Comment.toggle()
                        }
                    
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color("pink2"))
                }
            }
        }
        .padding(.horizontal)
    }
}

#if DEBUG
struct Comments_Previews: PreviewProvider {
    static var previews: some View {
        Comments()
            .preferredColorScheme(.dark)
    }
}
#endif
