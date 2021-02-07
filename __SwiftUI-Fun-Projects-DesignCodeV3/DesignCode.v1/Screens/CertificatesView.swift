//
//  ContentView.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/28/20.
//

import SwiftUI

struct CertificatesView: View {
    
    @State var show = false // for animation
    @State var viewState = CGSize.zero // for dragging gesture
    @State var showCard = false // to show the full card on bottom
    @State var bottomState = CGSize.zero // drag bottom card to adjust size
    @State var showFullBottomCard = false
    
    var body: some View {
        
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                // moves the whole top background upwards when showing card
                .offset(x: 0, y: showCard ? -200 : 0)
                .animation(
                    Animation // need this value type
                        .default
                        .delay(0.1)
//                        .speed(2)
                    //                        .repeatCount(3)
                )
            
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20) // cornerRadius is clipping the background
                .shadow(radius: 20 )
                .offset(x: 0, y: show ? -400 : -40) // note this comes first
                .offset(x: viewState.width, y: viewState.height)  // CGSize have viewstate of width and height
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(
                    Angle(degrees: showCard ? 0 : 10),
                    axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20) // cornerRadius is clipping the background
                .shadow(radius: 20 )
                .offset(x: 0, y: show ? -200 : -20) // offset for the angled card
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)// CGSize have viewstate of width and height
                
                .rotationEffect(Angle.degrees(show ? 0 : 5)) // note the ternary operator x ? :
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(
                    Angle(degrees: showCard ? 0 : 5),
                    axis: (x: 10.0, y: 0, z: 0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220) // expands the size when showing
                .background(Color.black)
                //                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20 )
                .offset(x: viewState.width, y: viewState.height)  // CGSize have viewstate of width and height
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    showCard.toggle()
                })
                
                // everytime the user drag, will get fed a value about the drag, and we assign the value to viewState variable assigned
                .gesture(DragGesture().onChanged { value in
                    viewState = value.translation
                    show = true
                    
                    
                }.onEnded({ (value) in
                    viewState = .zero // reset the position
                    show = false
                })
                )
            
            //            Text("\(bottomState.height)").offset(x: 0, y: -400)
            
            GeometryReader { bounds in
                BottomCardView(show: $showCard)
                    .offset(x: 0, y: showCard ? bounds.size.height / 2 : bounds.size.height + bounds.safeAreaInsets.top + bounds.safeAreaInsets.bottom)
                    .offset( y: bottomState.height)
                    .blur(radius: show ? 20 : 0)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8)) // custom timing curve
                    .gesture(
                        DragGesture()
                            .onChanged({ (value) in
                                bottomState = value.translation
                                if showFullBottomCard {
                                    bottomState.height += -300
                                }
                                // so we don't see the bottom of the card.
                                if bottomState.height < -300{
                                    bottomState.height = -300 // basically -300 is maximum drag
                                }
                            })
                            .onEnded({ (value) in
                                if bottomState.height > 75{
                                    showCard = false
                             
                                }
                                // if bottom card height is -100( little above ) of less and NOT showing full card, OR if bottomcard height is -250 (almost all the way up ) and showing full card, THEN run below code.
                                if (bottomState.height < -100 && !showFullBottomCard) ||
                                    (bottomState.height < -250 && showFullBottomCard){
                                    bottomState.height = -300
                                    showFullBottomCard = true
                                    
                                } else {
                                    bottomState = .zero
                                    showFullBottomCard = false
                                }
                        }))
            }
//            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CertificatesView()
//                .previewDevice("iPhone 11")
            //            ContentView().previewDevice("iPhone 11 Max Pro")
            //            ContentView().previewDevice("iPhone SE (2nd generation)")
        }
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("certificate")
                        .foregroundColor(Color("accent"))
                        .font(.title2)
                    
                }
                
                Spacer()
                Image("Logo1")
                
            } //  end of top section ( 2 Texts + Logo)
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("Card1").resizable().aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
            
        } // end of stack for whole card
    }
}

struct BackCardView: View {
//    var rotationDegrees: Double = 5
    
    var body: some View {
        VStack {
            Spacer()
        }
//        .scaleEffect(0.9)
//        .frame(width: 320, height: 220)
//        .rotationEffect(.init(degrees: rotationDegrees))
        
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1").resizable().aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
}

struct BottomCardView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        VStack (spacing: 20){ // the spacing goes between all contents
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design-Code Instructor")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            HStack(spacing: 20) {
                RingView(show: $show, colorOne: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), colorTwo: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), circleWidth: 88, circleHeight: 88, percent: 78)
                    .animation(Animation.easeInOut.delay(0.3))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                        
                    Text("12/12 sections completed \n 10 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(Color("secondary"))
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color("background2"))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                
                
            }
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: 712) // geometry reader doesn't center align containers, so added 2 frame
//        .background(Color.white)
        .background(BlurView(style: .systemThinMaterial)) // keyword Material means its dynamic and adaptable to darkmode for example.
        .cornerRadius(30)
        .shadow(radius: 20)
        .frame(maxWidth: .infinity)
        
    }
}
