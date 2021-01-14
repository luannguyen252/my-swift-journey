//
//  Board.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 14.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation

struct Board {
    
    /// Sub-type for adjascent tile direction
    enum Diagnol {
        case acending
        case descending
        
        /// upper half of the diagnol slope.
        var highSlope: (Int, Int) {
            switch self {
            case .acending:
                return (1, 1)
            case .descending:
                return (-1, 1)
            }
        }
        
        /// lower half of the diagnol slope
        var lowSlope: (Int, Int) {
            switch self {
            case .acending:
                return (-1, -1)
            case .descending:
                return (1, -1)
            }
        }
    }
    
    /// 2D array for Tile coordinates
    private(set) var tiles = [[Tile]]()
    private let columns: Int
    private let rows: Int

    init(columns: Int, rows: Int) {
        
        self.columns = columns
        self.rows = rows
        
        for column in 0..<columns {
            var c = [Tile]()
            for row in 0..<rows {
                c.append(Tile(column: column, row: row, state: .vacant))
            }
            tiles.append(c)
        }
    }
    
//MARK: - Get Tiles
    
    var tileCount: Int {
        return columns * rows
    }

    var columnCount: Int {
        return columns
    }

    func tilesFor(row: Int) -> [Tile] {
        (0..<tiles.count).map({ tiles[$0][row] })
    }

    func tilesFor(column: Int) -> [Tile] {
        tiles[column]
    }
    
    /// Return six adjacent tiles relative to the selected tile on diagnol slope. [[lowTiles], tiles, [highTiles]]
    /// - Parameter diagnol: The slope of the diagnol
    /// - Parameter column: The column index for selected tile
    /// - Parameter row: The row index for selected tile
    func tilesFor(diagnol: Diagnol, column: Int, row: Int) -> [Tile] {
        let tile = tiles[column][row]
        let highTiles = adjacentDiagnols(column: column, row: row, colIncrement: diagnol.highSlope.0, rowIncrement: diagnol.highSlope.1) ?? [Tile]()
        let lowTiles = adjacentDiagnols(column: column, row: row, colIncrement: diagnol.lowSlope.0, rowIncrement: diagnol.lowSlope.1) ?? [Tile]()
        return lowTiles + [tile] + highTiles
    }

//MARK: - Set Tiles
    
    /// Add a tile to the board for column index. Will optionally return the new tile if the column is not full
    /// - Parameter column: The column index for dropped tile
    /// - Parameter state: The state of the new tile
    @discardableResult
    mutating func addTile(inColumn column: Int, forState state: TileState) -> Tile? {
        if let emptyRow = tilesFor(column: column).filter({ $0.state == .vacant}).first?.row {
            let tile = Tile(column: column, row: emptyRow, state: state)
            tiles[column][emptyRow] = tile
            return tile
        }
        return nil
    }
}

extension Board {
    /// Optionally returns three successive tiles from any coordinate in any slope direction. If adjacent coordinate is out of bounds nil is returned
    /// - Parameter column: The column index for the tile
    /// - Parameter row: The row index for the tile
    /// - Parameter colIncrement: The y slope of the diagnol
    /// - Parameter rowIncrement: The x slope of the diagnol
    private func adjacentDiagnols(column: Int, row: Int, colIncrement: Int, rowIncrement: Int) -> [Tile]? {
        guard
            row + (rowIncrement * (rows / 2)) >= 0,
            row + (rowIncrement * (rows / 2)) < tiles[0].count,
            column + (colIncrement * (columns / 2)) >= 0,
            column + (colIncrement * (columns / 2)) < tiles.count
            else {
                return nil
        }
        return [
            tiles[column + colIncrement][row + rowIncrement],
            tiles[column + (colIncrement * 2)][row + (rowIncrement * 2)],
            tiles[column + (colIncrement * 3)][row + (rowIncrement * 3)]
        ]
    }
}


