//
//  GameBrain.swift
//  Connect 3 Game
//
//  Created by Sergey Sevriugin on 25/12/2019.
//  Copyright © 2019 Sergey Sevriugin. All rights reserved.
//

import Foundation

enum GameStatus: String {
    case open = "play"
    case closed = "winner"
    case error = "error"
}

class GameBrain: ObservableObject {
    @Published var board: [[Cell]]
    @Published var score: [Party: Int]
    @Published var status: GameStatus
    @Published var winner: Party
    @Published var dimension: Int
    var pathes: [Int]
    var mode: Int
    var userData: UserData
    var step: Int
    
    init(connect dimension: Int) {
        self.dimension = dimension
        self.board = [[Cell]]()
        self.pathes = [Int]()
        self.score = [Party.me: 0, Party.you: 0]
        self.mode = 0
        self.status = .open
        self.winner = .empty
        self.userData = UserData()
        self.step = 0
        self.newGame()
        self.score[.me] = self.userData.score.me
        self.score[.you] = self.userData.score.you
    }
    
    func setDimension(to dimension: Int) {
        if dimension < K.minDimension || dimension > K.maxDimension { return }
        self.dimension = dimension
        self.board = [[Cell]]()
        self.pathes = [Int]()
        self.score = [Party.me: 0, Party.you: 0]
        self.mode = 0
        self.status = .open
        self.winner = .empty
        self.userData = UserData()
        self.step = 0
        self.newGame()
        self.score[.me] = self.userData.score.me
        self.score[.you] = self.userData.score.you
    }
    
    func nextDimension() {
        if dimension >= K.maxDimension { return }
        self.setDimension(to: self.dimension + 1)
    }
    
    func prevDimension() {
        if dimension <= K.minDimension { return }
        self.setDimension(to: self.dimension - 1)
    }
    
    func newGame() {
        self.board = [[Cell]]()
        self.mode = Int.random(in: 0...3)
        self.status = .open
        self.winner = .empty
        self.step = 0
        
        for row in 0..<self.dimension {
            board.append([Cell]())
            for col in 0..<self.dimension {
                board[row].append(Cell(party: .nobody, row: row, col: col))
            }
        }
        
        self.pathes = [Int]()
        let n = self.dimension * 2 + 2;
        for i in 0..<n {
            pathes.append(i)
        }
        print("Game mode: \(self.mode)")
    }
    
    func showWinningPath(_ path: Int, winner: Party) {
        var count = 6
        var showEmpty = true
        _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            if count == 0 {
                timer.invalidate()
                return
            }
            count -= 1
            for i in 0..<self.dimension {
                let (r, c) = self.board.getRowCol(in: path, from: i)
                if showEmpty {
                    self.board[r][c].party = .nobody
                } else {
                    self.board[r][c].party = winner
                }
            }
            showEmpty = !showEmpty
        }
    }
    
    func checkStatus(_ path: Int) -> Bool {
        let (mc, yc, nc) = self.board.getCounts(in: path)
        if mc == self.dimension {
            self.winner = .me
            self.status = .closed
            self.score[.me]! += 1
            self.userData.score.me = self.score[.me]!
            self.showWinningPath(path, winner: .me)
            self.userData.save()
            return true
        }
        if yc == self.dimension {
            self.winner = .you
            self.status = .closed
            self.score[.you]! += 1
            self.userData.score.you = self.score[.you]!
            self.showWinningPath(path, winner: .you)
            self.userData.save()
            return true
        }
        if nc == 0 {
            self.winner = .nobody
            self.status = .closed
            return true
        }
        return false
    }
    
    
    func tapped(_ row: Int, _ col: Int) {
        if self.status != .open { return }
        
        if self.board[row][col].party == .nobody {
            self.board[row][col].party = .you
        }
        self.arrange()
        var path = self.pathes[0]
        if self.checkStatus(path) { return }
        
        let index = self.board.getFirst(in: path, with: .nobody)
        if index < 0 {
            self.status = .error
            return
        }
        let (r, c) = self.board.getRowCol(in: path, from: index)
        if self.mode > 1 && self.step == 0 && self.board[self.dimension / 2][self.dimension / 2].party == .nobody {
            self.board[self.dimension / 2][self.dimension / 2].party = .me
        } else {
            self.board[r][c].party = .me
        }
        self.step += 1
        
        self.arrange()
        path = self.pathes[0]
        if self.checkStatus(path) { return }
        
    }
    
    func arrange() {
        self.pathes.sort() {
            let (mc1, yc1, nc1) = self.board.getCounts(in: $0)
            let (mc2, yc2, nc2) = self.board.getCounts(in: $1)
            
            if mc1 == self.dimension || yc1 == self.dimension {
                return true
            }
            if mc2 == self.dimension || yc2 == self.dimension {
                return false
            }
            
            if mc1 + nc1 == self.dimension && nc1 == 1 {
                return true
            }
            if mc2 + nc2 == self.dimension && nc2 == 1 {
                return false
            }
            if yc1 + nc1 == self.dimension && nc1 == 1 {
                return true
            }
            if yc2 + nc2 == self.dimension && nc2 == 1 {
                return false
            }
            
            if self.mode == 0 {
                if mc1 + nc1 == self.dimension && mc2 + nc2 == self.dimension {
                    return mc1 > mc2
                }
                if mc1 + nc1 == self.dimension && yc2 + nc2 == self.dimension {
                    return true
                }
                if yc1 + nc1 == self.dimension  && mc2 + nc2 == self.dimension {
                     return false
                }
                if yc1 + nc1 == self.dimension && yc2 + nc2 == self.dimension {
                    return yc1 > yc2
                }
            } else if self.mode == 1 {
                if yc1 + nc1 == self.dimension && yc2 + nc2 == self.dimension {
                    return yc1 > yc2
                }
                if yc1 + nc1 == self.dimension  && mc2 + nc2 == self.dimension {
                     return true
                }
                if mc1 + nc1 == self.dimension && yc2 + nc2 == self.dimension {
                    return false
                }
                if mc1 + nc1 == self.dimension && mc2 + nc2 == self.dimension {
                    return mc1 > mc2
                }
            } else if self.mode == 2 {
                if mc1 + nc1 == self.dimension && mc2 + nc2 == self.dimension {
                    return $0 < $1
                }
                if yc1 + nc1 == self.dimension && yc2 + nc2 == self.dimension {
                    return $0 < $1
                }
                if mc1 + nc1 == self.dimension && yc2 + nc2 == self.dimension {
                    return $0 < $1
                }
                if yc1 + nc1 == self.dimension && mc2 + nc2 == self.dimension {
                    return $0 < $1
                }
            } else {
                if mc1 + nc1 == self.dimension && mc2 + nc2 == self.dimension {
                    return $0 > $1
                }
                if yc1 + nc1 == self.dimension && yc2 + nc2 == self.dimension {
                    return $0 > $1
                }
                if mc1 + nc1 == self.dimension && yc2 + nc2 == self.dimension {
                    return $0 > $1
                }
                if yc1 + nc1 == self.dimension && mc2 + nc2 == self.dimension {
                    return $0 > $1
                }
            }
            
            return nc1 > nc2
        }
    }
}

//MARK: - Array Extension

typealias BoardRaw = Array<Cell>

extension Array where Element == BoardRaw {
    func getCell(in path: Int, at index: Int) -> Cell {
        if path < self.count {
            return self[path][index] // row
        } else if path < self.count * 2 {
            return self[index][path - self.count] // col
        } else if path == self.count * 2 {
            return self[index][index] // diag 1
        } else {
            return self[index][self.count - 1 - index] // dial 2
        }
    }
    
    func getRowCol(in path: Int, from index: Int) -> (Int, Int) {
        if path < self.count {
            return (path, index) // row
        } else if path < self.count * 2 {
            return (index, path - self.count) // col
        } else if path == self.count * 2 {
            return (index, index) // diag 1
        } else {
            return (index, self.count - 1 - index) // dial 2
        }
    }
    
    func getCounts(in path: Int) -> (meCount: Int, youCount: Int, nobodyCount: Int) {
        var meCount = 0;
        var youCount = 0;
        var nobodyCount = 0;
        
        for i in 0..<self.count {
            let cell = getCell(in: path, at: i)
            switch cell.party {
            case .me:
                meCount += 1
            case .you:
                youCount += 1
            default:
                nobodyCount += 1
            }
        }
        return (meCount, youCount, nobodyCount)
    }
    
    func getFirst(in path: Int, with party: Party) -> Int {
        for i in 0..<self.count {
            let cell = getCell(in: path, at: i)
            if cell.party == party {
                return i
            }
        }
        return -1
    }
}
