//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct StateWithModifiers: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("State", subtitle: "With Modifiers", desc: "You can use state to control how your views look and change.", back: .blue, textColor: .white)
            Spacer()
            Button(action: {
                self.isOn.toggle()
            }) {
                ZStack(alignment: isOn ? .trailing : .leading) {
                    HStack {
                        Text("ON").opacity(isOn ? 1 : 0)
                        Text("OFF").opacity(isOn ? 0 : 1)
                    }
                    .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white)
                        .frame(width: 45, height: 50)
                }
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 8)
            .fill(isOn ? Color.green : Color.red))
            Spacer()
            DescView("The button's modifiers change because the value of a state variable is changing. The changes are all data driven.", back: .blue, textColor: .white)
        }
        .font(.title)
        .animation(.default)
    }
}

struct StateWithModifiers_Previews: PreviewProvider {
    static var previews: some View {
        StateWithModifiers()
    }
}
