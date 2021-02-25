//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class ValidatingInputViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var nameError: String = ""
    
    func submitName() {
        nameError = ""
        
        if name != "Miles" {
            nameError = "You can only enter 'Miles' in this field"
        }
    }
}

struct ValidatingInput: View {
    @ObservedObject var viewModel = ValidatingInputViewModel()
    
    var body: some View {
        VStack {
            Text("Enter 'Miles':")
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                viewModel.submitName()
            }) {
                Text("Submit Name")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 8))
            }
            .accentColor(.blue)
            .disabled(viewModel.name.isEmpty)
            
            Text(viewModel.nameError)
                .foregroundColor(.red)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ValidatingInput_Previews: PreviewProvider {
    static var previews: some View {
        ValidatingInput()
    }
}
