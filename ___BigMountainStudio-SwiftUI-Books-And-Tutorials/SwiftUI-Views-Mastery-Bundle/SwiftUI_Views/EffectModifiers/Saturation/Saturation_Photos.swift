//
//  Saturation_Photos.swift
//  100Views
//
//  Created by Mark Moeykens on 9/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Saturation_Photos: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                HeaderView("Saturation", subtitle: "With Photos", desc: "Saturation has the same effect on photos with the intensity of colors.",
                           back: .orange, textColor: .black)
                
                HStack(spacing: 20) {
                    VStack(spacing: 5) {
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .saturation(-1)
                            .overlay(Text("-1"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .saturation(0)
                            .overlay(Text("0"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .saturation(0.75)
                            .overlay(Text("0.75"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .saturation(1)
                            .overlay(Text("1 - Original"), alignment: .top)
                    }
                    VStack(spacing: 5) {
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .saturation(1.5)
                            .overlay(Text("1.5"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .saturation(3)
                            .overlay(Text("3"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .saturation(5)
                            .overlay(Text("5"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .saturation(20)
                            .overlay(Text("20"), alignment: .top)
                    }
                }
                .foregroundColor(.white)
            }
            .font(.title)
        }
    }
}

struct Saturation_Photos_Previews: PreviewProvider {
    static var previews: some View {
        Saturation_Photos()
    }
}
