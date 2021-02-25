//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NameData {
    var firstName = ""
    var lastName = ""
}

struct StateWithStructData: View {
    @State private var nameData = NameData()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("State", subtitle: "Working With Structs", desc: "You can use a struct for your single source of truth.", back: .blue, textColor: .white)
            
            Text("Full Name:")
            Text("\(nameData.firstName) \(nameData.lastName)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Group {
                Text("First and last names are both in the same struct:")
                TextField("first name", text: $nameData.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("last name", text: $nameData.lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            Spacer()
        }
        .font(.title)
    }
}

struct StateWithStructData_Previews: PreviewProvider {
    static var previews: some View {
        StateWithStructData()
    }
}
