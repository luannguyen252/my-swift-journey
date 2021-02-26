//
//  DetailView.swift
//  Scroll_Animation (iOS)
//
//  Created by Balaji on 25/02/21.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var currentPage: Int
    
    var body: some View{
        
        VStack(spacing: 20){
            
            Text("Details")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,edges?.top ?? 15)
            
            Image("img\(currentPage)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .cornerRadius(20)
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Dark Soul")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("By iJustine")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal,30)
            
            // Buttons...
            
            Button(action: {}, label: {
                Text("Download Image")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(
                    
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white,lineWidth: 1.5)
                    )
            })
            .padding(.vertical)
            
            Button(action: {}, label: {
                Text("Report Image")
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(
                    
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.red,lineWidth: 1.5)
                    )
            })
            
            Spacer()
        }
        .padding()
        .background(Color("slider").ignoresSafeArea())
    }
}
