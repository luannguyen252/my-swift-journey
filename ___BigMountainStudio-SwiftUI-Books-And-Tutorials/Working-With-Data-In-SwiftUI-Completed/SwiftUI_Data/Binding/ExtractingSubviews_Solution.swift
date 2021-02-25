//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ExtractingSubviews_Solution: View {
    @State var nameData = NameData(firstName: "Sean", lastName: "Ching")
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("", subtitle: "Solution with @Binding", desc: "Subviews that receive state data should use @Binding for a two-way binding.", back: .yellow)
                
                Spacer()
                
                Text("Full Name:")
                Text("\(nameData.firstName) \(nameData.lastName)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                // Include the dollar sign to create a two-way binding
                NavigationLink(destination: EditFirstLastNameView(nameData: $nameData)) {
                    
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

struct EditFirstLastNameView: View {
    @Binding var nameData: NameData // Binding will complete the 2-way connection between this and the parent view
    
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

struct ExtractingSubviews_Solution_Previews: PreviewProvider {
    @State static var nameData = NameData(firstName: "Test", lastName: "Data")
    
    static var previews: some View {
        Group {
            ExtractingSubviews_Solution()
            
            EditFirstLastNameView(nameData: $nameData)
                .previewLayout(.sizeThatFits)
            
            EditFirstLastNameView(nameData:
                                    Binding.constant(NameData(firstName: "Constant",
                                                              lastName: "Data")))
                .previewLayout(.sizeThatFits)
        }
    }
}
