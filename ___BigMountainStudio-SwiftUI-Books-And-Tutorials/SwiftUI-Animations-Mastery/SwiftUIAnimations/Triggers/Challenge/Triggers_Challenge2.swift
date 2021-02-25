//
//  Triggers_Challenge2.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Triggers_Challenge2: View {
    @State private var expanded = true
    
    var body: some View {
        GeometryReader { gp in
            VStack {
                Text("Kluane National Park")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: Alignment.leading)
                    .padding(.top, 40)
                    .padding(.leading, 30)
                    .animation(.easeOut)
                
                Image("KluaneNationalPark")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .padding(self.expanded ? 20 : 0)
                    .frame(width: gp.size.width, height: self.expanded ? 300 : 600)
                    .animation(.easeOut)
                
                Button(action: {
                    self.expanded.toggle()
                }, label: {
                    Image(systemName: "chevron.up")
                        .rotationEffect(Angle.degrees(self.expanded ? 180 : 0))
                })
                    .animation(.easeOut)
                
                Text("Kluane National Park and Reserve is in the southwest of the Yukon, in Canada. It’s a vast wilderness of ice fields, forests and towering peaks like Mount Logan. Trails include the King’s Throne, which winds above Kathleen Lake to a dramatic view. The Alsek River travels through areas inhabited by grizzly bears.")
                    .padding(.horizontal)
                    .animation(.easeOut)
            }
        }.font(.title)
    }
}

struct Triggers_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        Triggers_Challenge2()
    }
}
