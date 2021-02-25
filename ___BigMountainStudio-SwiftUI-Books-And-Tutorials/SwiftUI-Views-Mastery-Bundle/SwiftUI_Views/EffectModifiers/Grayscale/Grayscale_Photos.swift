//
//  Grayscale_Photos.swift
//  100Views
//
//  Created by Mark Moeykens on 9/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Grayscale_Photos: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Grayscale").font(.largeTitle)
                Text("With Photos").font(.title).foregroundColor(.gray)
                Text("The grayscale has the same effect on photos with the intensity of colors.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.yellow)
                    .foregroundColor(.black)
                
                HStack(spacing: 20) {
                    VStack(spacing: 5) {
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .grayscale(-1)
                            .overlay(Text("-1"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .overlay(Text("0"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .grayscale(0.75)
                            .overlay(Text("0.75"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .grayscale(1.1)
                            .overlay(Text("1.1"), alignment: .top)
                    }
                    VStack(spacing: 5) {
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .grayscale(1.5)
                            .overlay(Text("1.5"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .grayscale(3)
                            .overlay(Text("3"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .grayscale(5)
                            .overlay(Text("5"), alignment: .top)
                        Image("sunset").resizable()
                            .frame(width: 140, height: 140)
                            .grayscale(20)
                            .overlay(Text("20"), alignment: .top)
                    }
                }.foregroundColor(.white)
            }
        }
    }
}

struct Grayscale_Photos_Previews: PreviewProvider {
    static var previews: some View {
        Grayscale_Photos()
    }
}
