//
//  Home.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/29/20.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    // Created a Binding because showUpdate is decleared in Home.swift
    @Binding var showUpdate: Bool
    @Binding var showContent: Bool
    
    var body: some View {
        
        GeometryReader { bounds in
            ScrollView {
                VStack {
                    HStack {
                        Text("Watching")
                            // .bold()
                            // .modifier(CustomeFontModifier(size: 28))
                            .font(.system(size: 28, weight: .bold))

                        
                        Spacer()
                        
                        // passing the state of Binding
                        AvatarButtonView(showProfile: $showProfile)
                        
                        // bell button
                        // updated showUpdate to be showUpdate
                        AlertButtonView(showUpdate: showUpdate)
                    }
                    
                    .padding(.horizontal)
                    .padding(.leading, 14)
                    .padding(.top, 30)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        TopRingView()
                            .padding(.horizontal, 30)
                            .padding(.bottom, 15)
                            .onTapGesture(count: 1, perform: {
                                showContent = true
                            })
                    }
                 
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForEach(sectionData) { item in
                                
                                // GeometryReader provide values such as width and height of card position
                                GeometryReader { geometry in
                                    SectionView(section: item)
                                        .rotation3DEffect(
                                            Angle(degrees: Double(geometry.frame(in: (.global)).minX) / 20),
                                            axis: (x: 0.0, y: 1.0, z: 0.0)
                                        )
                                }
                                .frame(width: 275, height: 275)
                            }
                        }
                        .padding()
                        .padding(.bottom, 30)
                    }
                    .offset(y: -15)
                    
                    
                    HStack {
                        Text("Courses")
                            .font(.title).bold()
                        Spacer()
                    }
                    .padding(.leading, 30)

                    //MARK: Note here
                    ScrollView() {
                        ForEach(sectionData) { item in
                            SectionView(section: item,
                                        frameWidth: bounds.size.width - 60,
                                        frameHeight: 275)
                        }
                    }
                    
                    
                    Spacer()
                }
                .frame(width: bounds.size.width)
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showUpdate: .constant(false), showContent: .constant(false))
            .environmentObject(UserStore())
    }
}


struct SectionView: View {
    var section : Section
    var frameWidth: CGFloat = 275
    var frameHeight: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160,alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                Image(section.logo)
            } // end of H
            
            
            Text("\(section.subtitle) SECTIONS")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 210)
            
        } // end of V
        .padding(.top, 20)
        .padding(.horizontal)
        .frame(width: frameWidth, height: frameHeight)
        .background(section.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: section.backgroundColor.opacity(0.3), radius: 10, x: 0, y: 20)
    }
}


// data model for the ScrollView
struct Section: Identifiable{
    var id = UUID()
    var title: String
    var subtitle: Int //text
    var logo: String
    var image: Image
    var backgroundColor: Color
    
}

let sectionData = [
    Section(title: "Prototype designs in SwiftUI", subtitle: 18, logo: "Logo1", image: Image("Card2"), backgroundColor: Color("card1")),
    Section(title: "Build an SwiftUI app", subtitle: 20, logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4") ), backgroundColor: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    Section(title: "SwiftUI Advanced", subtitle: 25, logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card6") ), backgroundColor: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
]


struct TopRingView: View {
    var body: some View {
        HStack(spacing: 30) {
            // first card
            HStack(spacing: 12) {
                RingView(show: .constant(true), colorOne:(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), colorTwo: (#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), circleWidth: 44, circleHeight: 44, percent: 68)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text("6 minute left")
                        .bold()  // bold comes first before modifiers
                        .modifier(FontModifier(style: .subheadline))
                    
                    Text("Watched 10 minutes today")
                        .modifier(FontModifier(style: .caption))
                    
                }
                .modifier(FontModifier())
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(30)
            .modifier(DoubleShadowCustom(
                        firstOpacityPercentage: 0.1, firstRadius: 15, firstX: 0, firstY: 10,
                        secondOpacityPercentage: 0.1, secondRadius: 1, secondX: 0, secondY: 1))
            
            // second circle
            HStack(spacing: 12) {
                RingView(show: .constant(true), colorOne:(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), colorTwo: (#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), circleWidth: 32, circleHeight: 32, percent: 51)
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(30)
            .modifier(DoubleShadowCustom(
                        firstOpacityPercentage: 0.1, firstRadius: 15, firstX: 0, firstY: 10,
                        secondOpacityPercentage: 0.1, secondRadius: 1, secondX: 0, secondY: 1))
            
            // third circle
            HStack(spacing: 12) {
                RingView(show: .constant(true), colorOne:(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), colorTwo: (#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), circleWidth: 32, circleHeight: 32, percent: 20)
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(30)
            .modifier(DoubleShadowCustom(
                        firstOpacityPercentage: 0.1, firstRadius: 15, firstX: 0, firstY: 10,
                        secondOpacityPercentage: 0.1, secondRadius: 1, secondX: 0, secondY: 1))
            
        }
    }
}
