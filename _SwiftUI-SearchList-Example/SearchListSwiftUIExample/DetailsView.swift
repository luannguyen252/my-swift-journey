//
//  DetailsView.swift
//  SearchListSwiftUIExample
//
//  Created by John Codeos on 11/18/20.
//

import SwiftUI

struct DetailsView: View {
    var selectedCountry: String = "Selected Country"
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)).ignoresSafeArea()
            Text(selectedCountry)
                .foregroundColor(.white)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
