import UIKit


func createTreasureGrid(rows: Int, columns: Int) -> [[String]] {
    let (treasureRow, treasureColumn) = (Int.random(in: 0..<rows), Int.random(in: 0..<rows))
    
    var grid = Array(
        repeating: Array(repeating: "_", count: columns),
        count: rows
    )
    
    grid[treasureRow][treasureColumn] = "🦄"
    
    return grid
}


func findTreasure(in grid: [[String]]) {
    rowLoop: for (rowIndex, row) in grid.enumerated() {
        print("Searching thorugh row \(rowIndex)")
        
        columnLoop: for (columnIndex, columnValue) in row.enumerated() {
            print("Searching thorugh column \(columnIndex)")
            
            if columnValue == "🦄" {
                print("Found treasure at row \(rowIndex), column \(columnIndex)")
                
                // ⚠️ Without labels, `break` will only break out of the CURRENT loop -- that is,
                // we'll still be looping through more rows.
                //
                // break
                
                break rowLoop
            }
        }
    }
}

findTreasure(in: createTreasureGrid(rows: 4, columns: 9))
