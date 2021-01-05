//
//  Humidity.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/5/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import SwiftUI

struct WeatherPartials: View {
    var dataType: String? = "sunrise"
    var humidity: String? = ""
    var windSpeed: String? = ""
    var temp_min: String? = ""
    var temp_max: String? = ""
    var sunrise: String? = "5:55 AM"
    var sunset: String? = ""
    
    var body: some View {
        HStack(spacing: 20.0) {
            if dataType == "humidity" {
                Image(systemName: "thermometer")
                    .font(.system(.title))
                    .foregroundColor(Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
            }
            
            if dataType == "windSpeed" {
                Image(systemName: "tornado")
                    .font(.system(.title))
                    .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
            }
            
            if dataType == "min_temp" {
                Image(systemName: "arrow.down")
                    .font(.system(.title))
                    .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
            }
            
            if dataType == "max_temp" {
                Image(systemName: "arrow.up")
                    .font(.system(.title))
                    .foregroundColor(Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)))
            }
            
            if dataType == "sunrise" {
                Image(systemName: "sunrise.fill")
                    .font(.system(.title))
                    .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
            }
            
            if dataType == "sunset" {
                Image(systemName: "sunset.fill")
                    .font(.system(.title))
                    .foregroundColor(Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
            }
            
            VStack(spacing: 10) {
                if dataType == "humidity" {
                    Text("Humidity")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("\((humidity != "" ? humidity : "-") ?? "")")
                            .font(.callout).bold()
                        
                        Text("\(humidity != "" ? "%" : "")")
                            .font(.footnote).foregroundColor(Color.secondary)
                    }
                }
                
                if dataType == "windSpeed" {
                    Text("Wind Speed")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("\((windSpeed != "" ? windSpeed : "-") ?? "")")
                            .font(.callout).bold()
                        
                        Text("\(windSpeed != "" ? "km/hr" : "")")
                            .font(.footnote).foregroundColor(Color.secondary)
                    }
                }
                
                if dataType == "min_temp" {
                    Text("Min Temp")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("\((temp_min != "" ? temp_min : "-") ?? "")")
                            .font(.callout).bold()
                        
                        Text("\(temp_min != "" ? "°C" : "")")
                            .font(.footnote).foregroundColor(Color.secondary)
                    }
                }
                
                if dataType == "max_temp" {
                    Text("Max Temp")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("\((temp_max != "" ? temp_max : "-") ?? "")")
                            .font(.callout).bold()
                        
                        Text("\(temp_max != "" ? "°C" : "")")
                            .font(.footnote).foregroundColor(Color.secondary)
                    }
                }
                
                if dataType == "sunrise" {
                    Text("Sunrise")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("\((sunrise != "" ? sunrise?.lowercased().replacingOccurrences(of: "am", with: "") : "-") ?? "")")
                            .font(.callout).bold()
                        Text("am")
                            .font(.footnote).foregroundColor(Color.secondary)
                    }
                }
                
                if dataType == "sunset" {
                    Text("Sunset")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("\((sunset != "" ? sunset?.lowercased().replacingOccurrences(of: "pm", with: "") : "-") ?? "")")
                            .font(.callout).bold()
                        Text("pm")
                            .font(.footnote).foregroundColor(Color.secondary)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}

struct WeatherPartials_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPartials()
    }
}
