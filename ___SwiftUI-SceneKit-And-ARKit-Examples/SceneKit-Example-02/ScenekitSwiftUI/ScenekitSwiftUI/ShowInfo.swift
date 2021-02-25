//
//  ShowInfo.swift
//  ScenekitSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 14/11/20.
//

import SwiftUI

struct ShowInfo: View {
    
    @State var para = "The criteria for what constitutes human spaceflight vary, with some focus on the point where the atmosphere becomes so thin that centrifugal force, rather than aerodynamic force, carries a significant portion of the weight of the flight object. The Fédération Aéronautique Internationale (FAI) Sporting Code for astronautics recognizes only flights that exceed the Kármán line, at an altitude of 100 kilometers (62 mi).[4] In the United States, professional, military, and commercial astronauts who travel above an altitude of 50 miles (80 km)[5] are awarded astronaut wings. As of 17 November 2016, a total of 552 people from 36 countries have reached 100 km (62 mi) or more in altitude, of whom 549 reached low Earth orbit or beyond.[6] Of these, 24 people have traveled beyond low Earth orbit, either to lunar orbit, the lunar surface, or, in one case, a loop around the Moon.[7] Three of the 24—Jim Lovell, John Young and Eugene Cernan—did so twice.[8]s of 17 November 2016, under the U.S. definition, 558 people qualify as having reached space, above 50 miles (80 km) altitude. Of eight X-15 pilots who exceeded 50 miles (80 km) in altitude, only one exceeded 100 kilometers (about 62 miles).[6] Space travelers have spent over 41,790 man-days (114.5 man-years) in space, including over 100 astronaut-days of spacewalks.[9][10] As of 2016, the man with the longest cumulative time in space is Gennady Padalka, who has spent 879 days in space.[11] Peggy A. Whitson holds the record for the most time in space by a woman, 377 days."
    
    var body: some View {
        ZStack{
            
            Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack{
                
                Spacer()
                    .frame(width: 0, height: 60, alignment: .center)
               Image("name")
                .resizable()
                .frame(width: 400, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                Spacer()
                    .frame(width: 0, height: 60, alignment: .center)
            
                Text(para)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    .frame(width: 400, height: 700, alignment: .center)
                    .opacity(0.8)
                
            }
            HStack{
            Image("astro")
                .resizable()
                .frame(width: 450, height: 800, alignment: .center)
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                .opacity(1)
                
                Spacer()
                    .frame(width: 300, height: 100, alignment: .center)
            }
                
        }
    
    }
}

struct ShowInfo_Previews: PreviewProvider {
    static var previews: some View {
        ShowInfo()
    }
}
