//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ExtractingSubviews_Problem: View {
    @State var nameData = NameData(firstName: "Sean", lastName: "Ching")
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("", subtitle: "Pass State Into Subview", desc: "Passing a State variable into the subview will allow you to read the values but the updates do not come back.",
                           back: .yellow)
                
                Spacer()
                
                Text("Full Name:")
                Text("\(nameData.firstName) \(nameData.lastName)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                NavigationLink(destination: EditNameView(nameData: nameData)) {
                    
                    Text("Edit Name")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Capsule().fill(Color.blue))
                }
                
                Spacer()
            }
            .font(.title)
            .navigationTitle("Binding")
        }
    }
}

struct ExtractingSubviews_Problem_Previews: PreviewProvider {
    static var previews: some View {
        ExtractingSubviews_Problem()
    }
}

struct EditNameView: View {
    @State var nameData: NameData
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("Edit and go back when done:")
                
                TextField("first name", text: $nameData.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("last name", text: $nameData.lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
        }
        .navigationTitle("Edit Name")
    }
}
