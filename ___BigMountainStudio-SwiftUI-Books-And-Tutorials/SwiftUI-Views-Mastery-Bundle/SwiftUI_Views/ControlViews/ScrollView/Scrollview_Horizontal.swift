//  Copyright © 2020 Big Mountain Studio. All rights reserved.

import SwiftUI

struct Scrollview_Horizontal : View {
    var items = [Color.green, Color.blue, Color.purple, Color.pink,
                 Color.yellow, Color.orange]
    
    var body: some View {
        GeometryReader { gr in
            VStack(spacing: 40) {
                Text("ScrollView")
                    .font(.largeTitle)
                
                Text("Scroll Horizontally")
                    .font(.title)
                    .foregroundColor(.gray)
                
                Text("Just set the ScrollView's axis to horizontal and if the contents go horizontally beyond the frame, scrolling will be enabled.")
                    .frame(maxWidth: .infinity)
                    .padding().font(.title)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                
                ScrollView(Axis.Set.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(self.items, id: \.self) { item in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(item)
                                .frame(width: gr.size.width - 60,
                                       height: 200)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct Scrollview_Horizontal_Previews : PreviewProvider {
    static var previews: some View {
        Scrollview_Horizontal()
    }
}
