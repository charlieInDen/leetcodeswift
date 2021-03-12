class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        
        var rows: [String] = []
        for _ in 0..<numRows {
            rows.append("")
        }
        var index = 0
        var isAscending = true
        for c in s {
            rows[index] += String(c)
            if index == 0 {
                isAscending = true
            } else if index == numRows-1 {
                isAscending = false
            }
            if isAscending {
                index += 1
            } else {
                index -= 1
            }
        }
        return rows.joined()
    }
}
