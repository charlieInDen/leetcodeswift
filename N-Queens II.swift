class NQueenIISolution {
    func totalNQueens(_ n: Int) -> Int {
        var count = 0
        placeQueen(0, n, [], [], [], &count)
        return count
    }
    
    func placeQueen(_ row: Int, _ n: Int, _ colMap: Set<Int>, _ diag1Map: Set<Int>, _ diag2Map: Set<Int>, _ count: inout Int) {
        if row == n {
            count += 1
            return
        }
        
        for i in 0..<n {
            guard !colMap.contains(i) else { continue }
            guard !diag1Map.contains(row - i) else { continue }
            guard !diag2Map.contains(row + i) else { continue }
            
            var colMap = colMap, diag1Map = diag1Map, diag2Map = diag2Map
            colMap.insert(i)
            diag1Map.insert(row - i)
            diag2Map.insert(row + i)
            
            placeQueen(row + 1, n, colMap, diag1Map, diag2Map, &count)
        }
    }
}
