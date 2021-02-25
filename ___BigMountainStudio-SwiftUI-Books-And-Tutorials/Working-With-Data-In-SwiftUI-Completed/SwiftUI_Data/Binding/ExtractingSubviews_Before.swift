//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ExtractingSubviews_Before: View {
    @State var nameData = NameData(firstName: "Sean", lastName: "Ching")
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("", subtitle: "Before", desc: "You may have part of your view that uses a State variable value that you want to make into a Subview.",
                           back: .yellow)
                
                Spacer()
                
                Text("Full Name:")
                Text("\(nameData.firstName) \(nameData.lastName)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Spacer()
                
                // Subview this Group into a separate view
                Group {
                    Text("Edit Name")
                    
                    TextField("first name", text: $nameData.firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("last name", text: $nameData.lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .font(.title)
            .navigationTitle("Binding")
        }
    }
}

struct ExtractingSubviews_Before_Previews: PreviewProvider {
    static var previews: some View {
        ExtractingSubviews_Before()
    }
}
