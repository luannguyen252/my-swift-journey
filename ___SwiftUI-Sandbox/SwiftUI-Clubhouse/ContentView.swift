//
//  Clubhouse.swift
//  Playground
//
//  Created by Nav Singh on 2/11/21.
//

import SwiftUI

struct Clubhouse: View {
    var body: some View {
        ZStack {
            Color("club").edgesIgnoringSafeArea(.all)
            VStack {
                ClubHeader().padding()
                ClubBody().offset(y: 20)
                ClubFooter().frame(width: UIScreen.main.bounds.width, height: 100).background(Color(UIColor.systemBackground))
            }.padding(.top, 40).edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct ClubBody: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack (alignment: .leading, spacing: 24) {
                HStack (alignment: .top) {
                    VStack (alignment: .leading, spacing: 16) {
                        Text("SWAN DIVE 🏡")
                        Text("Live Coaching with Netflix cofounder Marc Randolph").font(.headline)
                    }.fixedSize(horizontal: false, vertical: true).frame(height: 60)
                    Spacer()
                    Image(systemName: "ellipsis").font(.system(size: 20))
                }.padding(.vertical)
                
                ForEach(1..<3) { _ in
                    HStack{
                        ForEach(1..<4) { _ in
                            Spacer()
                            VStack {
                                Image("photo").resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80).clipShape(RoundedRectangle(cornerRadius: 30))
                                Text("Steve").font(.subheadline).bold()
                            }
                            Spacer()
                        }
                    }
                }
                
                Text("Followed by the speakers").font(.footnote).foregroundColor(.secondary)
                
                ForEach(1..<10) { _ in
                    HStack{
                        ForEach(1..<5) { _ in
                            Spacer()
                            VStack {
                                Image("photo").resizable().aspectRatio(contentMode: .fill).frame(width: 54, height: 54).clipShape(RoundedRectangle(cornerRadius: 18))
                                Text("Steve").font(.footnote).bold()
                            }
                            Spacer()
                        }
                    }
                }
            }.padding(.all, 24)
        }.background(Color(UIColor.systemBackground)).clipShape(Curves(corner: .topLeft, radius: 24)).clipShape(Curves(corner: .topRight, radius: 24))
    }
}

struct ClubFooter: View {
    var body: some View {
        HStack (spacing: 16) {
            Button(action : {}) {
                HStack {
                    Text("✌️").font(.headline).font(.system(size: 48))
                    Text("Leave quietly").font(.headline).foregroundColor(.red)
                }.padding()
            }.background(Color.secondary.opacity(0.2)).clipShape(Capsule())
            
            Spacer()
            
            Image(systemName: "plus").font(.system(size: 20)).padding().background(Color.secondary.opacity(0.2)).clipShape(Circle())
            Image(systemName: "hand.raised").font(.system(size: 20)).padding().background(Color.secondary.opacity(0.2)).clipShape(Circle())
        }.padding()
    }
}

struct ClubHeader: View {
    var body: some View {
        HStack (spacing: 16) {
            Image(systemName: "chevron.down").font(.system(size: 24))
            Text("All rooms")
            Spacer()
            Image(systemName: "folder").font(.system(size: 24)).padding(.horizontal)
            Image("photo").resizable().aspectRatio(contentMode: .fill).frame(width: 36,height: 36).clipShape(Circle())
        }.font(.headline)
    }
}

struct Curves: Shape {
    var corner: UIRectCorner
    var radius: CGFloat
    
    func path (in rect: CGRect) -> Path {
        let path = UIBezierPath (roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Clubhouse_Previews: PreviewProvider {
    static var previews: some View {
        Clubhouse()
    }
}
