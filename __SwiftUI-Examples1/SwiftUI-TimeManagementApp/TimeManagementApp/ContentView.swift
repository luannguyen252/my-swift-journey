//
//  ContentView.swift
//  TimeManagementApp
//
//  Created by RyoNishimura on 2020/08/31.
//  Copyright © 2020 RyoNishimura. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var month = Calendar.current.component(.month, from: Date())
    @State var day = Calendar.current.component(.day, from: Date())
    @State var hour = Calendar.current.component(.hour, from: Date())
    @State var minute = Calendar.current.component(.minute, from: Date())
    @State var second = Calendar.current.component(.second, from: Date())
    
    @State private var name = ""
    @State private var message = ""
    @State private var editting = false
    
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        NavigationView  {
            
            VStack {
                HStack {
                    Text("\(hour)時\(minute)分\(second)秒")
                }
                HStack {
                    VStack {
                        Button(action: {
                            print("start")
                        }) {
                            Capsule()
                                .fill(Color.red)
                                .frame(width:250, height: 150)
                        }
                    }
                    Spacer()
                    Button(action: {}){
                        Text("End")
                    }
                }
            }
            .navigationBarTitle("\(month)月\(day)日")
            .navigationBarTitle("\(month)月\(day)日", displayMode: .inline)
            .onReceive(timer){_ in  // １秒毎にViewの情報を更新する
                    self.hour = Calendar.current.component(.hour, from: Date())
                    self.minute = Calendar.current.component(.minute, from: Date())
                    self.second = Calendar.current.component(.second, from: Date())
            }
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

