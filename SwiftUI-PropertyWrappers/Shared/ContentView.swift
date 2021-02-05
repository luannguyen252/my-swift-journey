//
//  ContentView.swift
//  Shared
//
//  Created by Master Family on 06/08/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var intValue = 0
    var body: some View {
        DataUserView(provider: DataProvider())
        }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}



struct StateExample: View {
    @State private var intValue = 0
    
    var body: some View {
        VStack {
            Text("intValue equals \(intValue)")
            
            BindingView(intValue: $intValue)
            
        }
    }
}
// You should use @State if:
// The view itself creates(and owns) the instance you want to wrap.
// You need to respond to changes that occur within the wrapped property
// You're wrapping a value type (struct or enum)





struct BindingView: View {
    @Binding var intValue: Int
    
    var body: some View {
        VStack {
            Button("increment") {
                intValue += 1
            }
        }
        
    }
}
//You should use @Binding if :
//You need read adn write access to a aproperty that's owned by a parent view
//The wrapped property is a value type (struct or enum)
//You don't own the wrapped property(it's provided by a parent view)





class DataProvider: ObservableObject {
    @Published var currentValue = "a value"
}

@available(OSX 11.0, *)
struct DataOwnerView: View {
    @StateObject private var provider = DataProvider()
    
    var body: some View {
        Text("provider value: \(provider.currentValue)")
    }
}
//You should use @StateObject if:
//You want to respond to changes or updates in an ObservableObject
//The view you're using @StateObject in creates the instance of the ObservableObject itself.





struct DataUserView: View {
    @ObservedObject var provider: DataProvider
    
    var body: some View {
        Text("The provider value is \(provider.currentValue)")
    }
}
//You should use @ObservedObject if:
//You want to respond to changes or updates in an ObservedObject
//The view does not create the instance of the ObservedObject itself(if it does use @StateObject)




struct EnvironmentUsingView: View {
    @EnvironmentObject var dependency: DataProvider
    
    var body: some View {
        Text(dependency.currentValue)
    }
}
//You should use @EnvironmentObject if:
//You would normally use an @ObservedObject but you would have to pass the ObservableObject through several view's initializers before it reaches the view where it's really needed.


