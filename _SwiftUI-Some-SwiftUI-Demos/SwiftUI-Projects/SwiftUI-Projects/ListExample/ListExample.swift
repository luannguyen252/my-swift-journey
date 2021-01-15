//
//  ListExample.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/16.
//

import SwiftUI

struct ListExample: View {
    
    @State var presented = false
    @State var fullPresented = false
    @State var push = false
    
    var body: some View {
        
        
        
        VStack {
            
            Button(action: {
                self.presented.toggle()
            }, label: {
                Text("模态跳转")
            })
            .sheet(isPresented: $presented, onDismiss: {
                print(self.presented)
            }, content: {
                Text("Detail")
            })
            .padding()
            
            Button(action: {
                self.fullPresented.toggle()
            }, label: {
                Text("全屏模态跳转")
            })
            .fullScreenCover(isPresented: $fullPresented) {
                FullDetail()
            }
            .padding()
            
            NavigationLink(destination: Text("Destination")) {
                Text("next")
            }
            .padding()
            
        }
    }
}


struct FullDetail: View {
    
    @Environment(\.presentationMode) var mode
    @AppStorage("value") var value = false
    
    var flag = true
    
    var body: some View {
        ZStack {
            Group {
                value ? Color.yellow : Color.red
            }
            .opacity(0.6).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Toggle(isOn: $value, label: {
                    Text("切换")
                })
                .frame(width: 100)
                
                Text("Click")
                    .onTapGesture {
                        self.mode.wrappedValue.dismiss()
                    }
            }
        }
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}



struct AContentView: View {
    @AppStorage("notificationsEnabled") var notificationsEnabled = false
    @AppStorage("lastNameEntered") var lastNameEntered = ""
    @State var name: String = ""

    var body: some View {
        VStack {
            Spacer()
            Toggle("Notifications", isOn: $notificationsEnabled)
            TextField("Name", text: $name)
            Button("Submit") {
                UserDefaults.standard.setValue(name, forKey: "lastNameEntered")
            }
            Spacer()
            Text("The last name you entered was \(lastNameEntered)")
        }
        .padding()
    }
}

