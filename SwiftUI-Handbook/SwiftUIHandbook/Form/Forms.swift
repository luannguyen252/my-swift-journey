//
//  Forms.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct Forms: View {
    var body: some View {
        Form {
            Text("First Item")
                .font(.title3)
                .foregroundColor(.black)
            
            Text("Second Item")
                .font(.title3)
                .foregroundColor(.black)
            
            Text("Third Item")
                .font(.title3)
                .foregroundColor(.black)
            
            // MARK: - FORM SECTION
            Section(header: Text("Form Section Title")) {
                Text("First Item in Section")
                    .font(.title3)
                    .foregroundColor(.black)
                Text("Second Item in Section")
                    .font(.title3)
                    .foregroundColor(.black)
                Text("Third Item in Section")
                    .font(.title3)
                    .foregroundColor(.black)
            }
        }
    }
}

struct Forms_Previews: PreviewProvider {
    static var previews: some View {
        Forms()
    }
}
