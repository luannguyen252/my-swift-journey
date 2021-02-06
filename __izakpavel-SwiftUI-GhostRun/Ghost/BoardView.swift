//
//  BoardView.swift
//  Ghost
//
//  Created by Pavel Zak on 28/10/2020.
//

import SwiftUI

enum TileObject {
    case none
    case cross
    case candy
}

class Tile : ObservableObject, Identifiable{
    let id: Int
    let boardSize: Int
    var x: Int
    var y: Int
    @Published var tileObject: TileObject = .none
    @Published var position: CGPoint = CGPoint()
    
    static func generateObject()->TileObject {
        let rand = Double.random(in: 0...1)
        if rand>0.9 {
            return .candy
        }
        else if rand>0.8 {
            return .cross
        }
        else {
            return .none
        }
    }
    
    init(x: Int, y: Int, index: Int, boardSize: Int) {
        self.x = x
        self.y = y
        self.id = index
        self.boardSize = boardSize
        
        self.tileObject = (x>2 && y>2) ? Self.generateObject() : .none
    }
    
    var isFirstRow: Bool {
        return (x == -1 || y == -1)
    }
    
    var isLastRow: Bool {
        return (x==boardSize || y==boardSize)
    }
    
    var scale: CGFloat {
        return (isFirstRow || isLastRow) ? 0.1 : 1
    }
    
    var opacity: Double {
        return (isFirstRow || isLastRow) ? 0.0 : 1
    }
    
    var zIndex: Double {
        return -5-Double(x + y)
    }
}

class Board: ObservableObject {
    let size: Int
    var availableSize: CGSize = CGSize() {
        didSet {
            self.adjustTilePositions()
        }
    }
    @Published var tiles: [Tile]
    var directionRight: Bool = true
    var timer: Timer? = nil
    
    var firstTile: Tile? {
        return self.tiles.filter { $0.x == 0 && $0.y == 0 }.first
    }
    
    func setTilePosition(_ tile: Tile) {
        let dx = availableSize.width/2/CGFloat(self.size)
        let dy = availableSize.height/2/CGFloat(self.size)
        
        let vx = CGPoint(x: -dx, y: -dy)
        let vy = CGPoint(x: dx, y: -dy)
        
        let a = vx*tile.x
        let b = vy*tile.y
        let c = CGPoint(x: availableSize.width/2, y: availableSize.height-dy)
        tile.position = c + a + b
    }
    
    func lastTiles(_ directionRight: Bool)->[Tile] {
        if directionRight {
            return self.tiles.filter { $0.y == size }
        }
        else {
            return self.tiles.filter { $0.x == size }
        }
    }
    
    init(size: Int) {
        self.size = size
        var tiles = [Tile]()
        for y in -1..<size+1 {
            for x in -1..<size+1 {
                let tile = Tile(x: x, y: y, index: tiles.count, boardSize: size)
                tiles.append(tile)
            }
        }
        self.tiles = tiles
        self.adjustTilePositions()
    }
    
    func adjustTilePositions() {
        self.tiles.forEach{ self.setTilePosition($0)}
    }
    
    func clear() {
        self.tiles.forEach{
            $0.tileObject = ($0.x>2 && $0.y>2) ? Tile.generateObject() : .none
        }
    }
    
    
    func move() {
        self.tiles.forEach { tile in
            if (directionRight) {
                tile.y = tile.y > -1 ? (tile.y - 1) : self.size
            }
            else {
                tile.x = tile.x > -1 ? (tile.x - 1) : self.size
            }
        }
        self.adjustTilePositions()
    }
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            withAnimation() {
                self.move()
            }
        }
    }
}

struct TileShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            
            path.move(to: CGPoint(x: 0, y: height/2))
            path.addLine(to: CGPoint(x: width/2, y: 0))
            path.addLine(to: CGPoint(x: width, y: height/2))
            path.addLine(to: CGPoint(x: width/2, y: height))
            path.addLine(to: CGPoint(x: 0, y: height/2))
        }
    }
}

struct TileView: View {
    @ObservedObject var tile: Tile
    var body: some View {
        
        let overlayCross = CrossView().opacity(tile.tileObject == .cross ? 1 : 0)
            .frame(width: 40, height: 40)
            .offset(x:0, y: -20)
        let overlayCandy = CandyView().opacity(tile.tileObject == .candy ? 1 : 0)
            .frame(width: 20, height: 20)
            .offset(x:0, y: -10)
        let back = TileShape().fill(Color("TileDark")).offset(x: 3, y: 2)
        TileShape()
            .fill(Color("TileBase"))
            .background(back)
            .overlay(overlayCross)
            .overlay(overlayCandy)
            .frame(width: 60, height: 40)
            .scaleEffect(self.tile.scale)
            .position(self.tile.position)
            .opacity(self.tile.opacity)
            .zIndex(tile.zIndex)
            
    }
}


struct BoardView: View {
    @ObservedObject var board: Board
    var ghost: Ghost
    
    var body: some View {
        GeometryReader { geometry in
            
            let availableSize = CGSize(width: min(geometry.size.width, geometry.size.height)*1.5, height: min(geometry.size.width, geometry.size.height))
            
            ZStack {
                ForEach (self.board.tiles) { tile in
                    TileView(tile: tile)
                }
                GhostView(ghost: self.ghost)
                    .frame(width: 30, height: 40)
                    .position(x: availableSize.width/2, y: availableSize.height-50)
            }
            .frame(width: availableSize.width, height: availableSize.height)
            .offset(x: (geometry.size.width-availableSize.width)/2, y: (geometry.size.height-availableSize.height)/2)
            .onAppear{
                self.board.availableSize = availableSize
                //self.board.start()
            }
        }
    }
}

