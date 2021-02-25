//
//  ContentView.swift
//  Shared
//
//  Created by Mohammad Azam on 7/29/20.
//

import SwiftUI


struct MusicPlayerBar: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        HStack {
            Image("cover")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(4)
                .padding()
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            Text("Baby Blue")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "play.fill")
            Image(systemName: "forward.fill")
                .padding(.trailing, 10)
        }.frame(maxWidth: .infinity, maxHeight: 60)
        .background(Color(#colorLiteral(red: 0.8808270097, green: 0.8809750676, blue: 0.8808075786, alpha: 1)))
    }
}

struct MusicPlayer: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Image("cover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Baby Blue")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text("Badfinger")
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                        .foregroundColor(Color.white)
                    
                }.padding()
                Spacer()
            }
            
            HStack {
                Image(systemName: "backward.fill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                
                
                Image(systemName: "play.fill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                    .padding([.leading, .trailing],75)
                
                Image(systemName: "forward.fill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            
            Spacer()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.234857142, green: 0.043259345, blue: 0.04711621255, alpha: 1)))
    }
}

struct ContentView: View {
    
    @Namespace private var ns
    @State private var showDetails: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if showDetails {
                MusicPlayer(namespace: ns)
            } else {
                MusicPlayerBar(namespace: ns)
            }
        }.onTapGesture {
            withAnimation(.spring()) {
                showDetails.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
