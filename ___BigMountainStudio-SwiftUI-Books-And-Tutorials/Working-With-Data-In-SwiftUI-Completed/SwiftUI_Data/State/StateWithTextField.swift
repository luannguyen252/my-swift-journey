//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct StateWithTextField: View {
    @State var name = "Mariana"
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("State", subtitle: "Two-way Binding", desc: "Add a dollar sign ($) before the variable name to create a two-way binding between a control and a state variable.", back: .blue, textColor: .white)
            
            Spacer()
            TextField("Enter name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Text("Name:")
            Text("\(name)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Spacer()
            DescView("A two-way binding means when the state variable is updated, the control gets updated. And when the control updates the value, the state variable gets updated.", back: .blue, textColor: .white)
        }
        .font(.title)
    }
}

struct StateWithTextField_Previews: PreviewProvider {
    static var previews: some View {
        StateWithTextField()
    }
}
