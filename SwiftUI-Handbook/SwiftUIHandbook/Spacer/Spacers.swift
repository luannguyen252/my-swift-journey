//
//  Spacers.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct Spacers: View {
    var body: some View {
        // MARK: - EXAMPLE 1
        VStack() {
            Text("First Item")
            Spacer()
            Text("Second Item")
        }
        
        // MARK: - EXAMPLE 2
        VStack() {
            Text("First Item")
            Spacer()
            Text("Second Item")
            Spacer()
            Text("Third Item")
        }
        
        // MARK: - EXAMPLE 3
        VStack() {
            Text("First Item")
            Spacer()
            Text("Second Item")
            Spacer()
            Text("Third Item")
            Spacer()
            Text("Fourth Item")
        }
        
        // MARK: - EXAMPLE 4
        VStack {
            // 1.
            HStack {
                Image(systemName: "1.circle.fill")
                Image(systemName: "arrow.left.circle.fill")
                Spacer()
            }.padding()
            
            Spacer()
            // 2.
            HStack {
                Image(systemName: "arrow.left.circle.fill")
                Spacer()
                Image(systemName: "2.circle.fill")
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
            }.padding()
            
            Spacer()
            // 3.
            HStack {
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                Image(systemName: "3.circle.fill")
            }.padding()
            
        }
        .foregroundColor(Color.white)
        .background(RoundedRectangle(cornerRadius: 10))
        .foregroundColor(Color.blue)
        .font(.largeTitle)
        .padding()
        .frame(width:400, height: 400)
        
        // MARK: - EXAMPLE 5
        HStack {
            Image(systemName: "message.fill")
            Text("Inbox")
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal)
        
        // MARK: - EXAMPLE 5: NO SPACER
        HStack {
            Image(systemName: "message.fill")
            Text("Inbox")
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal)
        
        // MARK: - EXAMPLE 5: WITH BACKGROUND
        HStack {
            Image(systemName: "message.fill")
            Text("Inbox")
            Spacer()
                .frame(height: 10)
                .background(Color.blue)
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal)
        
        // MARK: - EXAMPLE 5: MIN LENGTH
        HStack {
            Image(systemName: "message.fill")
            Spacer(minLength: 50)
            Text("Inbox is a place where you able to connect to people worldwide").lineLimit(1)
        }
    }
}

struct Spacers_Previews: PreviewProvider {
    static var previews: some View {
        Spacers()
    }
}
