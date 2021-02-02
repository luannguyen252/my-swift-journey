import SwiftUI

struct ContentView: View {
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        TabView {
            ForEach(data) { story in
                GeometryReader { g in
                    ZStack {
                        LinearGradient(gradient: .init(colors: [Color(story.color).opacity(0.25), Color(story.color).opacity(0.25)]), startPoint: .top, endPoint: .bottomTrailing)
                            .cornerRadius(16)
                        
                        Image(story.story)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 16)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                                Capsule()
                                    .fill(Color("dark").opacity(0.3))
                                    .frame(height: 2.5)
                                
                                Capsule()
                                    .fill(Color("light"))
                                    .frame(width: story.offset, height: 2.5)
                            })
                            
                            HStack(spacing: 16) {
                                Image(story.story)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                Text(story.name)
                                    .foregroundColor(Color("light"))
                                    .fontWeight(.bold)
                                
                                Text(story.time)
                                    .foregroundColor(Color("light"))
                            }
                            
                            Spacer()
                            
                            
                        }
                        .padding(.all)
                    }
                    .frame(width: g.frame(in: .global).width, height: g.frame(in: .global).height)
                    .rotation3DEffect(
                        .init(degrees: getAngle(xOffset: g.frame(in: .global).minX)),
                        axis: (x: 0.0, y: 1.0, z: 0.0),
                        anchor: g.frame(in: .global).minX > 0 ? .leading : .trailing,
                        perspective: 2.5
                    )
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color("dark").edgesIgnoringSafeArea(.all))
        .statusBar(hidden: true)
    }
    
    func getAngle(xOffset: CGFloat) -> Double {
        let tempAngle = xOffset / (width / 2)
        let rotationDegree: CGFloat = 25
        return Double(tempAngle * rotationDegree)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Story: Identifiable {
    var id = UUID().uuidString
    var story: String
    var name: String
    var time: String
    var offset: CGFloat
    var color: String
}

var data = [
    Story(story: "p1", name: "Story 1", time: "1h", offset: 100, color: "green"),
    Story(story: "p2", name: "Story 2", time: "2h", offset: 200, color: "orange"),
    Story(story: "p3", name: "Story 3", time: "3h", offset: 50, color: "yellow"),
    Story(story: "p4", name: "Story 4", time: "4h", offset: 250, color: "red"),
    Story(story: "p5", name: "Story 5", time: "5h", offset: 80, color: "purple"),
    Story(story: "p6", name: "Story 6", time: "6h", offset: 100, color: "blue"),
]
