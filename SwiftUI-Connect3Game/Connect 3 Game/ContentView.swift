//
//  ContentView.swift
//  Connect 3 Game
//
//  Created by Sergey Sevriugin on 25/12/2019.
//  Copyright © 2019 Sergey Sevriugin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = GameBrain(connect: K.dimension)
    
    var body: some View {
        
            VStack {
                HStack {
                    WinnerView(winner: game.winner)
                    Text(game.status.rawValue)
                }
                HStack {
                    ScoreView(score: self.game.score, party: .you)
                    ScoreView(score: self.game.score, party: .me)
                }
                Spacer()
                ZStack {
                    NetView(dimension: self.game.dimension)
                    VStack {
                        BoardView(board: self.game.board) { row, col in self.game.tapped(row, col) }
                    }.setSize(size: K.Board.size)
                }
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.game.prevDimension()
                    }) {
                        Image(systemName: "chevron.left").opacity(self.game.dimension == K.minDimension ? 0.5: 1.0)
                    }
                    Spacer()
                    Button(action: {
                        print(K.Button.text)
                        
                        self.game.newGame()
                    }) { RoundedRectangle(cornerRadius: K.Button.radius)
                        .frame(width: K.Button.width, height: K.Button.height, alignment: .center)
                        .overlay(Text(K.Button.text)
                            .foregroundColor(.white))
                    }
                    Spacer()
                    Button(action: {
                        self.game.nextDimension()
                    }) {
                        Image(systemName: "chevron.right").opacity(self.game.dimension == K.maxDimension ? 0.5: 1.0)
                    }
                    Spacer()
                    

                }
                Spacer()
            }
        
    }
}

//MARK: - Sub Views
struct ScoreView: View {
    var score: [Party: Int]
    var party: Party
    var body: some View {
        Image(party.rawValue)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .setSize(size: K.Score.size)
            .overlay(Text(String(score[party]!)).bold().foregroundColor(.white))
    }
}

struct CountView: View {
    var cell: Cell
    var body: some View {
        Image(cell.party.rawValue)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .setSize(size: K.Cell.size)
            .padding(K.Cell.padding)
    }
}

struct RowView: View {
    var row: [Cell]
    var onTap: (_ row: Int, _ col:Int) -> Void
    
    var body: some View {
        ForEach(row, id: \.id) { cell in
            CountView(cell: cell).onTapGesture {
                self.onTap(cell.row, cell.col)
            }
        }
    }
}

struct BoardView: View {
    var board: [[Cell]]
    var onTap: (_ row: Int, _ col:Int) -> Void
    
    var body: some View {
        ForEach(board, id: \.self) { row in
            HStack {
                RowView(row: row) { row, col in self.onTap(row, col) }
            }.setWidth(width: K.Board.size)
        }
    }
}

struct WinnerView: View {
    var winner: Party
    var color: Color {
        switch winner {
        case .me :
            return Color.yellow
        case .you :
            return Color.red
        case .empty :
            return Color.green
        default:
            return Color.gray
        }
    }
    
    var body: some View {
        
        Circle().frame(width: 10, height: 10, alignment: .center).foregroundColor(self.color)
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//MARK: - View Extension
extension View {
    func setSize(size: CGFloat) -> some View {
        return self.frame(minWidth: nil, idealWidth: size, maxWidth: size, minHeight: nil, idealHeight: size, maxHeight: size, alignment: .center)
    }
    func setWidth(width: CGFloat) -> some View {
        return self.frame(minWidth: nil, idealWidth: width, maxWidth: width, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
    }
}

