//
//  ContentView.swift
//  Images and modifiers
//
//  Created by Stephen DeStefano on 9/6/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image("swiftui-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Image(systemName: "faceid")
                .font(.largeTitle)
                .padding()
            
            Image(systemName: "wifi")
                .imageScale(.large)
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
                .background(Color.black)
                .font(.system(size: 50))
                .padding()
            
            Image(systemName: "person.icloud.fill")
            .font(.system(size: 50))
            .blur(radius: 3)
            .foregroundColor(.red)
            
        }
    }
}


struct ContentView2: View {
var body: some View {
    
    VStack {
            Image("backgroundImage")
           .resizable()
           .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
           
        }
    }
}

struct ContentView3: View {
var body: some View {
    
    VStack {
        
        List{
            //create the rows
            ForEach(0..<10) { _ in
                HStack{
                    //create the colums
                    ForEach(0..<3) { _ in
                    Image("backgroundImage2")
                    .resizable()
                    .scaledToFit()
                   }
                }
             }
           }
        }
    }
}


struct ContentView4: View {
    
    @State private var img: UIImage? = nil
    let staticImage = UIImage(named: "backgroundImage2")
    
var body: some View {
    Image(uiImage: self.img ?? staticImage!)
        .resizable()
        .onAppear(perform: imageDownloader)
        .frame(width: CGFloat(400), height: CGFloat(400), alignment: .center)
        .onTapGesture {
            //run some code
            print("Image was tapped")
    }
}
    
    func imageDownloader() {
        
        guard let imgURL = URL(string: "https://picsum.photos/400/400?i=30") else {
            print("Could not find images at this URL")
            return
        }
        URLSession.shared.dataTask(with: imgURL) { (data, response, error) in
            if let imageData = data, let imageToDisplay = UIImage(data: imageData) {
                self.img = imageToDisplay
            } else {
                print("error\(String(describing: error))")
            }
        }.resume()
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView2()
            ContentView3()
            ContentView4()
        }
    }
}
