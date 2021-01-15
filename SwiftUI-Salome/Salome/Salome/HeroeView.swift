//
//  HeroeView.swift
//  Salome
//
//  Created by App Designer2 on 16.08.20.
//

import SwiftUI

struct HeroeView: View {
      var body: some View {
         
          Home()
              .edgesIgnoringSafeArea(.top)
      }
  }
  
  struct HeroeView_Previews: PreviewProvider {
      static var previews: some View {
          ContentView()
      }
  }
  
  struct Home : View {
      
      var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
      @State var selected : Travel = data[0]
      @State var show = false
      @Namespace var namespace
      // to load Hero View After Animation is done....
      @State var loadView = false
      
    @ObservedObject public var detail = Nael()
    
    @State var image : Data = .init(count: 0)
    
      var body: some View{
          
          ZStack{
  
              ScrollView(.vertical, showsIndicators: false) {
                  
                  HStack{
                      
                      Text("Travel")
                          .font(.system(size: 35, weight: .bold))
                          .foregroundColor(.black)
                      
                      Spacer()
                      
                      Button(action: {}) {
                          
                          Image("menu")
                              .renderingMode(.original)
                          
                      }
                  }
                  // due to top area is ignored...
                  .padding([.horizontal,.top])
                  
                  // Grid View...
                  
                  LazyVGrid(columns: columns,spacing: 25) {
                      
                      ForEach(data){travel in
                          
                          VStack(alignment: .leading, spacing: 10){
                              
                              Image(travel.image)
                                  .resizable()
                                  .frame(height: 180)
                                  .cornerRadius(15)
                                  // assigning ID..
                                  .onTapGesture {
                                      
                                      withAnimation(.spring()){
                                          
                                          show.toggle()
                                          selected = travel
                                          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                              
                                              loadView.toggle()
                                          }
                                      }
                                  }
                                  .matchedGeometryEffect(id: travel.id, in: namespace)
                              
                              Text(travel.title)
                                  .fontWeight(.bold)
                                  .foregroundColor(.black)
                          }
                      }
                  }
                  .padding([.horizontal,.bottom])
              }
              .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
  
              // Hero View....
              
              if show {
                  
                  VStack {
                      
                      ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                          
                        Image(selected.image)
                              .resizable()
                              .frame(height: 300)
                              .matchedGeometryEffect(id: selected.id, in: namespace)
                          
                          if loadView {
                              
                              
                              HStack {
                                  
                                  Button {
                                      
                                      loadView.toggle()
                                      
                                      withAnimation(.spring()){
                                          
                                          show.toggle()
                                      }
                                      
                                  } label: {
                                   
                                      Image(systemName: "xmark")
                                          .foregroundColor(.white)
                                          .padding()
                                          .background(Color.black.opacity(0.5))
                                          .clipShape(Circle())
                                  }
  
                                  Spacer()
                                  
                                  Button {
                                      
                                      
                                  } label: {
                                   
                                      Image(systemName: "suit.heart.fill")
                                          .foregroundColor(.red)
                                          .padding()
                                          .background(Color.white)
                                          .clipShape(Circle())
                                  }
                              }
                              .padding(.top,35)
                              .padding(.horizontal)
                              
                          }//if loadView
                        
                      }//ZStack
                      
                      // you will get this warning becasue we didnt hide the old view so dont worry about that it will work fine...
                      
                      // Detail View....
                      
                      ScrollView(.vertical, showsIndicators: false) {
                          
                          // loading after animation completes...
                          
                          if loadView{
                              
                              VStack{
                                  
                                  HStack{
                                      
                                      Text(selected.title)
                                          .font(.title)
                                          .fontWeight(.bold)
                                          .foregroundColor(.black)
                                      
                                      Spacer()
                                  }
                                  .padding(.top)
                                  .padding(.horizontal)
                                  
                                  // some sample txt...
                                  
                                  Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.")
                                      .multilineTextAlignment(.leading)
                                      .padding(.top)
                                      .padding(.horizontal)
                                  
                                  HStack{
                                      
                                      Text("Reviews")
                                          .font(.title)
                                          .fontWeight(.bold)
                                          .foregroundColor(.black)
                                      
                                      Spacer()
                                  }
                                  .padding(.top)
                                  .padding(.horizontal)
                                  
                                  HStack(spacing: 0){
                                      
                                      ForEach(1...5,id: \.self){i in
                                          
                                          Image("r(i)")
                                              .resizable()
                                              .aspectRatio(contentMode: .fill)
                                              .frame(width: 50, height: 50)
                                              .clipShape(Circle())
                                              .offset(x: -CGFloat(i * 20))
                                      }
                                      
                                      Spacer(minLength: 0)
                                      
                                      Button(action: {}) {
                                          
                                          Text("View All")
                                              .fontWeight(.bold)
                                      }
                                  }
                                  // since first is moved -20
                                  .padding(.leading,20)
                                  .padding(.top)
                                  .padding(.horizontal)
                                  
                                  // Carousel...
                                  
                                  HStack{
                                      
                                      Text("Other Places")
                                          .font(.title)
                                          .fontWeight(.bold)
                                          .foregroundColor(.black)
                                      
                                      Spacer()
                                  }
                                  .padding(.top)
                                  .padding(.horizontal)
                                  
                                  TabView{
                                      
                                      ForEach(1...6,id: \.self){i in
                                          
                                          // ignoring the current Hero Image...
                                          
                                          if "p(i)" != selected.image{
                                              
                                              Image("p(i)")
                                                  .resizable()
                                                  .cornerRadius(15)
                                                  .padding(.horizontal)
                                          }
                                      }
                                  }
                                  .frame(height: 250)
                                  .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                  .padding(.top)
                                  
                                  // Button..
                                  
                                  Button(action: {}) {
                                      
                                      Text("Book Trip")
                                          .fontWeight(.bold)
                                          .foregroundColor(.white)
                                          .padding(.vertical)
                                          .frame(width: UIScreen.main.bounds.width - 150)
                                          .background(Color.blue)
                                          .cornerRadius(15)
                                  }
                                  .padding(.top,25)
                                  .padding(.bottom)
                              }
                          }
                      }
                  }
                  .background(Color.white)
              }
          }
          .background(Color.white.edgesIgnoringSafeArea(.all))
          // hiding for hero Vieww.....
          .statusBar(hidden: show ? true : false)
        
      }//body : some View
  }
  
  // sample Data...
  
  struct Travel : Identifiable {
      
      var id : Int
      var image : String
      var title : String
  }
  
  var data = [
  
      Travel(id: 0, image: "p1", title: "London"),
      Travel(id: 1, image: "p2", title: "USA"),
      Travel(id: 2, image: "p3", title: "Canada"),
      Travel(id: 3, image: "p4", title: "Australia"),
      Travel(id: 4, image: "p5", title: "Germany"),
      Travel(id: 5, image: "p6", title: "Dubai"),
  
  ]
