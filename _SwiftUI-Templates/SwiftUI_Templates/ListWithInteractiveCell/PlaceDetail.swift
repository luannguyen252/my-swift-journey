//
//  PlaceDetail.swift
//  SwiftUI_Templates
//
//  Created by Hui, Malachi | DCMS on 2020/05/06.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import SwiftUI


struct PlaceDetail: View {
    var course: Course
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    // MARK: PLACEDETAIL BODY
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(course.title)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color.white)
                            Text(course.subtitle)
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        
                        Spacer()
                        
                        ZStack {
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 36, height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                            }
                        }
                    }
                    Spacer()
                    Image(uiImage: course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 140, alignment: .top)
                }
                .padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
                    //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
                    .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                    .background(Color(course.color))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text(placeBioDetail().0)
                    Text(placeBioDetail().1)
                        .bold()
                        .font(.system(size: 20))
                        .underline()
                    Text(placeBioDetail().2)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(placeBioDetail().3)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // MARK: PLACE DETAIL METHODS
    func placeBioDetail() -> (String, String, String, String) {
        var title:String
        var hightlightTitle:String
        var bodyOne:String
        var bodyTwo:String
        let unicodeHeart = "\u{2661}"
        
        switch activeIndex {
        case 0:
            title = "In Boston, is where it all started."
            hightlightTitle = "The streets and education"
            bodyOne = "I was born in Chicago until the age of 1.  My Life really started in the nitty gritty streets of the greater Boston Area.  Growing up, life was a colourful and troubled childhood.  Adventures like HuckleBerry Finn with the pain of Boyz In The Hood. Many mistakes were made and lesson's were learned.  The biggest lesson was experiencing the mindset of those that I did not want to be like."
            bodyTwo = "I eventually left the small city I grew up in and attended Northeastern University in Boston.  It's was my primary choice for college and I got in!!!  I had a rough start, transitioning from a public education to a private university, but if you want to be in the big leagues; you better be ready to fight for it.  The lovely thing about Boston is that it's the education Capitol of the United States.  All the different minds I was introduced to, from different cultural values, diverse people from communities all over the United States and the world.  I was able to accomplish a Bachelors of Science in Computer Engineering and be the founding President of the Premiere Urban Dance Company at the University."
            return (title, hightlightTitle, bodyOne, bodyTwo)
        case 1:
            title = "San Francisco took me to the next level."
            hightlightTitle = "Surviving San Francisco mentally."
            bodyOne = "I have a creative soul complimented with an analytical mind which landed me in San Francisco.  No, I did not move to San Francisco for a job, quite the contrary as I arrived a new graduate and unemployed.  Mathematically speaking, I have an engineering educational background moving into the heart of the Tech valley, the odds seemed to make sense to me.  At the time of moving to San Francisco, the recession hit, jobs were scarce but talent was plentiful.  So many engineering talent and I started to feel like I wasn't at calibur with the tech market.  It brought me back to my thoughts when I joined university: if you want to be in the big leagues, I better be ready to fight for it.  So challeng was accepted!"
            bodyTwo = "My experience in San Francisco was a game changer in my mentality as a person.  I fell in love with the Tech industry and constantly imagined ways to improve life with tech.  The mindset and process of Silicon Valley is light years ahead from the industry markets outside of it.  The place where you can be astounded, self founded, and beauty hounded.  Where beauty goes to meet the beast.  It was 10 years in San Francisco, my experience there was priceless.  I was a hip hop dancer in a professional dance company, I completed a program at UC Berkeley for Project Management, a candidate in a test pilot group for Stanford University and Apple in IOS Development, I produced major events for celebrities and athletes in the greater Bay Area, I won $7000 placing 2nd in a hackathon, had an app launch event, and I tutored kids of angel investors of Silicon Valley.  I experienced all facets of the market: technology, media, growth/scale, product / process, and innovation.  People are suprised when they hear my experience because of down-to-earth personality.  Jay-Z says it best: Critics say he's all about money, cash, hoes!  I'm from the hood stupid, what type of facts are those!"
            return (title, hightlightTitle, bodyOne, bodyTwo)
        case 2:
            title = "I left my \(unicodeHeart) in San Francisco and..."
            hightlightTitle = "Tokyo drifted away!"
            bodyOne = "As much as I loved San Francisco, it became repetitive.  Technology evolved annually and I would spend time catching up to the the lastest developments only to be left behind again in the next coming year.  What is worst is the latest and greatest technology doesn't translate to what the current market is currently executing.  I was over this cycle and longed for a different experience.  I've reached the pinnacle of my experience in the United States.  My only option was to go international but the craziest part of it was that I had no intention or plan for it.  It was just an exotic idea."
            bodyTwo = "After a few visits to Tokyo, I thought to myself: if I had the opportunity I would take it.  That opporunity came during a world tour visit with Tokyo being one of the destinations.  I've learned that where ever you travel, meet the market, understand what is being built and ideas they are spreading.  That would lead to me getting a request for an interview from a famous millenial media company in Tokyo.  The interview date was set on my way to climbing Mt. Fuji.  After climbing Mt. Fuji, I attended the interview that would lead to an offer.  It was a good offer by Japan standards but definitely quite a bit of a paycut from my standards.  I stayed true to my heart as I did say that if an opportunity was given, I'd take it.  Carpe Diem!"
            return (title, hightlightTitle, bodyOne, bodyTwo)
        default:
            title = ""
            hightlightTitle = ""
            bodyOne = ""
            bodyTwo = ""
            return (title, hightlightTitle, bodyOne, bodyTwo)
        }
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(course: placeData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1))
    }
}
