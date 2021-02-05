//
//  ContentView.swift
//  Maillot
//
//  Created by Daval Cato on 5/16/20.
//  Copyright © 2020 Daval Cato. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack(spacing: 15){
                
                ZStack{
                    
                    Text("Maillot").font(.title)
                    
                    HStack(spacing: 18){
                        
                        Button(action: {
                            
                            
                        }) {
                            
                            Image("Menu").renderingMode(.original)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("search").renderingMode(.original)
                        }
                      
                        Button(action: {
                            
                        }) {
                            
                            Image("noti").renderingMode(.original)
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("shop").renderingMode(.original)
                        }
                    }
                }.background(Color.white)
                    //Adding the space between the buttons
                    .padding([.leading,.trailing,.top], 15)
                
              MainView()
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView : View{
    
    @State var selected = "Dress"
    
    var body: some View{
        
        VStack(spacing: 15){
            
            HStack{
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        HStack{
                            
                            Text("Causal Dress")
                            
                            Spacer()
                            
                            Image("down")
                        }.padding()
                        
                    }.foregroundColor(.black)
                        .background(Color.white)
                    
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("filter").renderingMode(.original).padding()
                        
                    }.background(Color.white)
                }
            }
            
            HStack{
                
                ForEach(types,id: \.self){i in
                    
                    HStack{
                        
                        Button(action: {
                            
                            self.selected = i
                            
                        }) {
                            
                            Text(i).padding()
                            
                        }
                        .foregroundColor(self.selected == i ? .white : .black)
                        .background(self.selected == i ? Color.black : Color.clear)
                        
                        Spacer(minLength: 0)
                    }
                }
            }
            
            DetailsScroll()
            
        }.padding()
        .background(Color("Color"))
    }
}

struct DetailsScroll : View {
    
    @State var show = false
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 12){
                
                ForEach(datas){i in
                    
                    HStack{
                        
                        ForEach(i.row){j in
                            
                            Cards(row: j)
                            
                        }
                    }
                }
            }
        }
    }
}

struct Cards : View {
    
    var row : row
    @State var show = false
    
    var body : some View{
        
        VStack(spacing: 8){
            
            NavigationLink(destination: DetailView(show: $show), isActive: $show) {
                
                Image(row.image).renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width / 2 - 25, height: 240)
            }
            
            HStack{
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(row.name)
                    Text(row.price).fontWeight(.heavy)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("option").renderingMode(.original)
                    
                }.padding(.trailing, 15)
            }
        }
        
    }
}

struct DetailView : View{
    
    @Binding var show : Bool
    @State var size = ""
    
    var body : some View{
        
        VStack(spacing: 0){
            
            HStack(spacing: 18){
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Image("Back").renderingMode(.original)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("search").renderingMode(.original)
                }
        
                Button(action: {
                    
                }) {
                    
                    Image("shop").renderingMode(.original)
                }
                
            }.navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
                //This is the padding for the search and shop icons
                .padding([.bottom,.leading,.trailing], 15)
                
            
            Image("pic").resizable()
            
            VStack(alignment: .leading, spacing: 15){
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Summer Vibes").font(.largeTitle)
                        Text("199.99").fontWeight(.heavy)
                        
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10){
                        
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                        Circle().fill(Color.blue).frame(width: 20, height: 20)
                        Circle().fill(Color.red).frame(width: 20, height: 20)
                        
                    }
                    
                }
                
                Text("You can even compare future fashion purchases with current pieces in your closet!")
                
                Text("Select Size")
                
                HStack{
                    
                    ForEach(sizes,id: \.self){i in
                        
                        Button(action: {
                            
                            self.size = i
                            
                        }) {
                            
                            Text(i).padding().border(Color.black, width: self.size == i ? 1.5 : 0)
                        }.foregroundColor(.black)
                    }
                }
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        Text("Add To Cart").padding().border(Color.black, width: 1.4)
                    }.foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Buy Now").padding()
                        
                    }.foregroundColor(.white)
                     .background(Color.black)
                     .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                 .padding(.top, 15)
                
            }.padding()
            .background(rounded().fill(Color.white))
            .padding(.top, -50)
        }
    }
}

struct rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
    
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}


struct type : Identifiable{
    
    var id : Int
    var row : [row]
}

struct row : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
    
}

// This is for the sample data already made earlier

var sizes = ["S","M","X","XL"]

var types = ["Dress","Pants","Blazers","Jackets"]

var datas = [
    

    type(id: 0,row: [row(id:0,name: "Fit And Flare", price: "$199", image: "p11"),row(id:1,name: "Empire Dress", price: "$136", image: "p12")]),

    type(id: 2,row: [row(id:0,name: "Summer Vibes", price: "$136", image: "p21"),row(id:1,name: "Flora Fun", price: "$150", image: "p22")]),

]
