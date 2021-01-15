//
//  ContentView.swift
//  CustomAlerts
//
//  Created by Umer Khan on 23/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert: Bool = false
    @State private var alertWithTextField: Bool = false
    @State private var message: String = ""
    
    var body: some View {
        
        ZStack {
            ZStack {
                Circle().foregroundColor(Color.green.opacity(0.5))
                    .position(x: .random(in: 0...50), y: -90)
                
                Circle().foregroundColor(Color.purple.opacity(0.5))
                    .position(x: 250, y: .random(in: 50...100))
                
                Circle().foregroundColor(Color.orange.opacity(0.5))
                    .position(x: .random(in: 300...400), y: 350)
                
                Circle().foregroundColor(Color.pink.opacity(0.5))
                    .position(x: 60, y: .random(in: 100...500))
                
                VStack {
                    Button("Show Simple Alert") {
                        withAnimation {
                            self.showingAlert.toggle()
                        }
                    }
                    .padding()
                    .foregroundColor(.black)
                    .overlay(
                    
                        Rectangle()
                            .stroke(Color.black, style: StrokeStyle(lineWidth: 1))
                    )
                    
                    Button("Alert with Text Field") {
                        withAnimation {
                            self.alertWithTextField.toggle()
                        }
                    }
                    .padding()
                    .foregroundColor(.black)
                    .overlay(
                    
                        Rectangle()
                            .stroke(Color.black, style: StrokeStyle(lineWidth: 1))
                    )
                }
            }
            .opacity(showingAlert || alertWithTextField ? 0.5 : 1.0)
            
            
            if showingAlert {
                    AlertView(showingAlert: $showingAlert)
            }
            
            if alertWithTextField {
                AlertWithTextField(showingAlert: $alertWithTextField, text: $message)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
