//
//  GeometryReader_MinMidMax.swift
//  100Views
//
//  Created by Mark Moeykens on 9/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct GeometryReader_MinMidMax: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("GeometryReader", subtitle: "Min Mid Max", desc: "You can also get the minimum (min), middle (mid), and maximum (max) X and Y coordinate from the geometry reader's frame.", back: .clear)
            
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 20) {
                    Text("Local Coordinate Space")
                    HStack(spacing: 10) {
                        // I'm converting to Int just so we don't have so many zeros
                        Text("minX: \(Int(geometry.frame(in: .local).minX))")
                        Spacer()
                        Text("midX: \(Int(geometry.frame(in: .local).midX))")
                        Spacer()
                        Text("maxX: \(Int(geometry.frame(in: .local).maxX))")
                    }
                    Text("Global Coordinate Space")
                    HStack(spacing: 10) {
                        // I'm converting to Int just so we don't have so many zeros
                        Text("minX: \(Int(geometry.frame(in: .global).minX))")
                        Spacer()
                        Text("midX: \(Int(geometry.frame(in: .global).midX))")
                        Spacer()
                        Text("maxX: \(Int(geometry.frame(in: .global).maxX))")
                    }
                }.padding(.horizontal)
            }
            .frame(height: 200)
            .foregroundColor(.white)
            .background(Color.pink)
            
            HStack {
                GeometryReader { geometry in
                    VStack(spacing: 10) {
                        Text("minY: \(Int(geometry.frame(in: .global).minY))")
                        Spacer()
                        Text("midY: \(Int(geometry.frame(in: .global).midY))")
                        Spacer()
                        Text("maxY: \(Int(geometry.frame(in: .global).maxY))")
                    }.padding(.vertical)
                }
                .foregroundColor(.white)
                .background(Color.pink)
                
                Image("MinMidMax")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .font(.title)
        .padding()
    }
}

struct GeometryReader_MinMidMax_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader_MinMidMax()
    }
}
