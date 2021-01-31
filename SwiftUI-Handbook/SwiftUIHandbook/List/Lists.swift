//
//  List.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct Lists: View {
    var body: some View {
        List(dataList) { data in
            VStack(alignment: .center,spacing: 8) {
                HStack(alignment: .center, spacing: 16) {
                    Image(systemName: data.avatar)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(24)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("\(data.name), \(data.age)")
                            .font(.title3)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text(data.address)
                            .font(.callout)
                            .foregroundColor(.black).opacity(0.6)
                        
                        Text(data.isAvailable ? "Available" : "Not available")
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(data.isAvailable ? .green : .red)
                    } //: VSTACK
                } //: HSTACK
                .padding(.vertical, 8)
              } //: VSTACK
          }
    }
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        Lists()
    }
}
