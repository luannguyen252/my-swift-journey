import SwiftUI

struct ContentView: View {
    @State var player = Player()
    
    @State var food = [Item]()
    @State var bomb = [Item]()
    
    @State var elapsedSec = 0.0
    @State var lastDate = Date()
    @State var score = 0
    
    let updateTimer = Timer.publish(every: 0.05, on: .current, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    Spacer()
                    Text("\(self.score)")
                        .foregroundColor(self.score > 0 ? Color.blue : Color.red)
                        .font(.largeTitle)
                    Spacer()
                    
                }
                .edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: 60)
                
                ZStack{
                    // food
                    ForEach(self.food, id: \.id) { item in
                        Circle()
                            .frame(width: item.radius * 2, height: item.radius * 2)
                            .foregroundColor(Color.blue)
                            .position(item.pos)
                    }
                    
                    // bomb
                    ForEach(self.bomb, id: \.id) { item in
                        Rectangle()
                            .frame(width: item.radius * 2, height: item.radius * 2)
                            .foregroundColor(Color.red)
                            .position(item.pos)
                    }
                    
                    // player
                    Circle()
                        .frame(width: 20 * 2, height: 20 * 2)
                        .foregroundColor(Color.blue)
                        .position(self.player.pos)
                    
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .gesture(
                DragGesture(minimumDistance: 50)
                    .onEnded { v in
                        let dX = (v.location.x - v.startLocation.x) * 2
                        let dY = (v.location.y - v.startLocation.y) * 2
                        self.player.target.x = self.player.pos.x + dX
                        self.player.target.y = self.player.pos.y + dY
                }
                
            )
            .onReceive(self.updateTimer, perform: {_ in
                let now = Date()
                self.elapsedSec = Double(now.timeIntervalSince(self.lastDate))
                self.lastDate = now
                
                self.movePlayer()
                
                self.checkOutOfBounds(geometry: geometry);
                
                var collisions = self.food.filter{ $0.collide(to: self.player) }
                self.food.removeAll(where: {collisions.contains($0)})
                self.food.append(contentsOf: collisions.map({ _ in Item.spawn(within: geometry)}))
                self.score += collisions.count
                
                collisions = self.bomb.filter{ $0.collide(to: self.player) }
                self.bomb.removeAll(where: {collisions.contains($0)})
                self.bomb.append(contentsOf: collisions.map({ _ in Item.spawn(within: geometry)}))
                self.score -= collisions.count * 10
                
            })
            .onAppear{
                self.player.pos = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                self.player.target = self.player.pos
                
                for _ in 1...3{
                    self.food.append(.spawn(within: geometry))
                }
                
                for _ in 1...5{
                    self.bomb.append(.spawn(within: geometry))
                }
            }
        }
    }
    
    func movePlayer(){
        let x = Double(self.player.target.x - self.player.pos.x)
        let y = Double(self.player.target.y - self.player.pos.y)
        
        let distance = sqrt((x * x) + (y * y))
        let angleRad = atan2(y, x)
        
        let velocity = distance / 0.5
        var dX = velocity * cos(angleRad);
        var dY = velocity * sin(angleRad);
        
        dX = self.elapsedSec * dX
        dY = self.elapsedSec * dY
        
        self.player.pos.x += CGFloat(dX)
        self.player.pos.y += CGFloat(dY)
        
    }
    
    func checkOutOfBounds(geometry : GeometryProxy){
        if self.player.pos.x < 0 {
            self.player.pos.x = geometry.size.width
            self.player.target.x = geometry.size.width + self.player.target.x
            
        } else if self.player.pos.x > geometry.size.width{
            self.player.pos.x = 0
            self.player.target.x = self.player.target.x - geometry.size.width
        }
        
        if self.player.pos.y < 0 {
            self.player.pos.y = geometry.size.height
            self.player.target.y = geometry.size.height + self.player.target.y
            
        } else if self.player.pos.y > geometry.size.height{
            self.player.pos.y = 0
            self.player.target.y = self.player.target.y - geometry.size.height
        }
        
    }
    
}

struct Player : GameElement{
    var pos = CGPoint(x:0,y:0)
    var target = CGPoint(x:0,y:0)
    var radius = CGFloat(20.0)
    
}
struct Item : GameElement, Equatable{
    var id = UUID()
    var pos = CGPoint(x:0,y:0)
    var radius = CGFloat(5.0)
    
    static func spawn(within : GeometryProxy) -> Item{
        var f = Item()
        f.pos.x = CGFloat.random(in: 0..<within.size.width)
        f.pos.y = CGFloat.random(in: 0..<within.size.height)
        return f
    }
    
}

protocol GameElement  {
    var pos: CGPoint { get }
    var radius: CGFloat { get }
    
}

extension GameElement {
    func collide(to : GameElement) -> Bool{
        let p1 = self.pos
        let p2 = to.pos
        let r1 = self.radius
        let r2 = to.radius
        
        // (x2-x1)^2 + (y1-y2)^2 <= (r1+r2)^2
        let distance = pow(p2.x - p1.x, 2) + pow(p1.y - p2.y, 2)
        let minDistance = pow(r1+r2, 2)
        
        return distance <= minDistance
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
