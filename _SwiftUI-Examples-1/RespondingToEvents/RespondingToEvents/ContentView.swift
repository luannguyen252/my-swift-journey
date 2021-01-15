import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: AppearExample()) {
                    Text("AppearExample")
                }
                
                NavigationLink(destination: ButtonExample()) {
                    Text("ButtonExample")
                }
                
                NavigationLink(destination: HitTestingExample()) {
                    Text("HitTestingExample")
                }
                
                NavigationLink(destination: HoveringExample()) {
                    Text("HoveringExample")
                }
                
                NavigationLink(destination: NavigationWithButtonExample()) {
                    Text("NavigationWithButtonExample")
                }
                
                NavigationLink(destination: PickerExample()) {
                    Text("PickerExample")
                }
                
                NavigationLink(destination: SlideExample()) {
                    Text("SlideExample")
                }
                
                NavigationLink(destination: StepperExample()) {
                    Text("StepperExample")
                }
                
                NavigationLink(destination: TapGestureExample()) {
                    Text("TapGestureExample")
                }
                
//                NavigationLink(destination: TextFieldExample()) {
//                    Text("TextFieldExample")
//                }
                
                NavigationLink(destination: ToggleSwitchExample()) {
                    Text("ToggleSwitchExample")
                }
                .navigationBarTitle("RespondingToEvents")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
