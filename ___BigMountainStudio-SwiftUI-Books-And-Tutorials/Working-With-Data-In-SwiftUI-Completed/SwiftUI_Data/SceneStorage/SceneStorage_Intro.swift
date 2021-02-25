//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct SceneStorage_Intro: View {
    @State private var textInput = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("",
                           subtitle: "Introduction",
                           desc: "Use @SceneStorage to save data for just one screen that will persist for the lifetime of the app.", back: .pink)
                
                NavigationLink("Enter New Data", destination: SceneStorage_DataEntry())
            }
            .font(.title)
            .navigationTitle("@SceneStorage")
        }
    }
}

struct SceneStorage_DataEntry: View {
    @SceneStorage("textInput") var textInput = ""
    @State var stateText = ""
    
    var body: some View {
        VStack(spacing: 20) {
            DescView("Enter data in here and then navigate away. It will be saved to the variable using @SceneStorage.", back: .pink)
                .layoutPriority(1)
            TextEditor(text: $textInput)
                .border(Color.pink)
                .padding()
            
            DescView("This data will not be saved because it's bound to a @State variable.", back: .pink)
            TextEditor(text: $stateText)
                .border(Color.pink)
                .padding()
        }
        .font(.title)
    }
}

struct SceneStorage_Intro_Previews: PreviewProvider {
    @SceneStorage("textInput") var textInput = "Preview Data"
    
    static var previews: some View {
        Group {
            SceneStorage_Intro()
            
            NavigationView {
                SceneStorage_DataEntry(textInput: "textInput", stateText: "stateText")
            }
        }
    }
}
