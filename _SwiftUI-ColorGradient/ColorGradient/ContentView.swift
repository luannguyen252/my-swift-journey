//
//  ContentView.swift
//  ColorGradient
//
//  Created by Tony Hajdini on 07/11/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(cards) { c in
                    VStack(alignment: .trailing ) {
                        HStack(alignment: .top){
                            VStack(alignment: .leading) {
                                Text(c.title)
                                    .font(.title)
                                    .bold()
                                Text(c.subTitle)
                                    .font(.subheadline)
                                    .foregroundColor(Color.secondary)

                            }.padding(.horizontal, 0)
                            Spacer()
                        }.padding()
                        Spacer()
                        HStack {
                            HStack {
                                Text(c.name)
                                    .font(.caption)
                                    .fontWeight(.black)
                                    .foregroundColor(Color.secondary)
                                    
                                    Spacer()
                                Image(c.photo)
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }.padding()
                       
                        }.background(Color.black.opacity(0.2))
                    }
                    
                    .frame(width: 370, height: 280)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .top, endPoint: .bottomTrailing))
                    .cornerRadius(20)
                    .shadow(radius: 12)
                    .padding(.bottom, 20)
                }
                .padding(35)
            } .padding(-20)
            .navigationTitle("Professionals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Card: Identifiable {
    let id = UUID()
    let name: String
    let photo: String
    let title: String
    let subTitle: String
}

let cards = [
    Card(name: "Nicky Dolores", photo: "user", title: "Make up Artist", subTitle: "Hourly - 24$"),
    Card(name: "Elie Smith", photo: "user1", title: "Model", subTitle: "Hourly - 400$"),
    Card(name: "Debby Doe", photo: "user2", title: "Influencer", subTitle: "Hourly - 2,004$")
]
