//
//  Humidity.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/5/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import SwiftUI

struct WeatherPartials: View {
    var humidity: String? = ""
    
    var body: some View {
        HStack(spacing: 20.0) {
            Image(systemName: "thermometer")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 38)
                .foregroundColor(Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
            VStack(spacing: 10) {
                Text("Humidity")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\((humidity != "" ? humidity : "-") ?? "") \(humidity != "" ? "%" : "")")
                    .font(.title).bold()
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
        .shadow(color: Color.black.opacity(0.12), radius: 10, x: 0, y: 10)
    }
}

struct Humidity_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPartials()
    }
}
