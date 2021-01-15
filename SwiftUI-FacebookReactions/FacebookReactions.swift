//
//  FacebookReactions.swift
//
//  Created by Fabio Giolito on 10/06/2019.
//  Follow me: https://twitter.com/fabiogiolito
//

import SwiftUI

struct FacebookReactions : View {
    
    @State var isDragging = false
    @State var selectedReaction: String? = nil

    var reactions = ["love", "laugh", "wow", "sad", "angry"]
    var reactionSize: CGFloat = 50
    var reactionSpacing: CGFloat = 10
    
    var body: some View {

        ZStack(alignment: .leading) {

            // Reactions
            HStack(spacing: reactionSpacing) {
                ForEach(reactions.identified(by: \.self)) { reaction in
                    Image(reaction).resizable().animation(.spring())
                        .frame(
                            width:  (self.selectedReaction == reaction ? self.reactionSize * 1.5 : self.reactionSize),
                            height: (self.selectedReaction == reaction ? self.reactionSize * 1.5 : self.reactionSize))
                        .offset(y: self.isDragging ?
                            self.selectedReaction == reaction ? (self.reactionSize * -1.5) : (self.reactionSize * -1) : 0)
                        .opacity(self.isDragging ? 1 : 0)
                }
            }
            .frame(width: reactionSize, height: reactionSize)
            .offset(x: ((reactionSize + reactionSpacing) * CGFloat(reactions.count) - reactionSpacing - reactionSize) / 2 )

            // Like button
            Image("like").resizable()
                .frame(width: reactionSize, height: reactionSize)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.isDragging = true
                            if (value.translation.height < (self.reactionSize * -0.5) &&
                                value.translation.height > (self.reactionSize * -2.5)
                            ){
                                var id = Int(floor(value.translation.width / (self.reactionSize + self.reactionSpacing)))
                                if (id < self.reactions.count) {
                                    if (id < 0)  { id = 0 }
                                    self.selectedReaction = self.reactions[id]
                                }
                            } else {
                                self.selectedReaction = nil
                            }

                        }
                        .onEnded { value in
                            self.selectedReaction = nil
                            self.isDragging = false
                    }
                )
        }
        .frame(width: reactionSize, height: reactionSize)

    }
}


#if DEBUG
struct FacebookReactions_Previews : PreviewProvider {
    static var previews: some View {
        HStack {
            FacebookReactions()
            Spacer()
        }.padding()
    }
}
#endif
