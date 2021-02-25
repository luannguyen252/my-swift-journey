//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TapGesture_ButtonMimic: View {
    @GestureState var longPressGestureState = false
    @State private var showTerms = false
    
    var isTouchedDown: Bool {
        // use this place to call functions when the value changes
        showTerms = true
        return longPressGestureState
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                //            HeaderView("LongPressGesture",
                //                       subtitle: "Mimic Buttons",
                //                       desc: "Let's try changing the color when pressed.", back: .pink)
                
                Group {
                    Text("Receive total direct deposit of at least $1,000 within the last 31 days. ")
                        + Text("Terms and conditions")
                        .foregroundColor(isTouchedDown ? Color(#colorLiteral(red: 0.6941176471, green: 0.337254902, blue: 0.8745098039, alpha: 0.396621919)) : .purple)
                }
                .gesture(
                    LongPressGesture(minimumDuration: .infinity)
                        .updating($longPressGestureState) { value, state, _ in
                            state = value
                        }
                )
                
            }
            .font(.title)
            
            if showTerms {
                VStack {
                    Text("Terms and Conditions")
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                }
                .padding()
                .background(Color(.systemBackground))
                .shadow(radius: 8)
            }
        }
    }
}

struct TapGesture_ButtonMimic_Previews: PreviewProvider {
    static var previews: some View {
        TapGesture_ButtonMimic()
    }
}
