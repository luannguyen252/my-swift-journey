//
//  SFSymbols.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct SFSymbols: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: "sun.max.fill")
                    .font(.largeTitle)
                Text("Sun")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "moon.fill")
                    .font(.largeTitle)
                Text("Moon")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "cloud.fill")
                    .font(.largeTitle)
                Text("Cloud")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "cloud.rain.fill")
                    .font(.largeTitle)
                Text("Rain")
                    .font(.title)
                    .fontWeight(.semibold)
                
            }
            
            HStack(spacing: 16) {
                Image(systemName: "cloud.bolt.fill")
                    .font(.largeTitle)
                Text("Thunder")
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct SFSymbols_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbols()
    }
}
