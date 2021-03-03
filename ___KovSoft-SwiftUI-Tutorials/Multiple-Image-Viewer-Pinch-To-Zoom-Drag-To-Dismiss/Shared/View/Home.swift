//
//  Home.swift
//  Image_Viewer (iOS)
//
//  Created by Balaji on 01/03/21.
//

import SwiftUI

struct Home: View {
    
    @StateObject var homeData = HomeViewModel()
    
    // SwitUI has bug in Page Tab Bar...
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        ScrollView{
            
            // Tweet View...
            
            HStack(alignment: .top, spacing: 15, content: {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    // In SwiftUI we can concatenate two or more Text's....
                    (
                    
                        Text("Kavsoft  ")
                            .fontWeight(.bold)
                        
                        +
                        
                        Text("@_Kavsoft")
                            .foregroundColor(.gray)
                    )
                    
                    Text("#ios #swiftui #kavsoft")
                        .foregroundColor(.blue)
                    
                    Text("iJustine New Photots :))))")
                    
                    // Our Custom Grid of Items.....
                    
                    // Since we having only two columns in a row...
                    // and max is 4 Grid Boxes....
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
                    
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 10, content: {

                        ForEach(homeData.allImages.indices,id: \.self){index in
                            
                            GridImageView(index: index)
                        }
                    })
                    .padding(.top)
                })
            })
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .overlay(
        
            // Image Viewer....
            ImageView()
        )
        //setting envoronment Object...
        .environmentObject(homeData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
