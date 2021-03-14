class Solution {
     func search(_ length: Int, _ n: Int, _ S: String) -> Int {
        var seen = Set<String>()
        var tmp: String = ""
        for startOffset in 0..<(n - length + 1) {
            let startIndex = S.index(S.startIndex, offsetBy: startOffset)
            let endIndex = S.index(S.startIndex, offsetBy: startOffset + length)
            let range = startIndex..<endIndex
            tmp = String(S[range])
            if seen.contains(tmp) {
                return startOffset
            }
            seen.insert(tmp)
        }
        
        return -1
    }
    
    func longestRepeatingSubstring(_ S: String) -> Int {
        let n = S.count
        var left = 1
        var right = n
        
        var length = 0
        while left <= right {
            length = left + (right - left) / 2
            if search(length, n, S) != -1 {
                left = length + 1
            } else {
                right = length - 1
            }
        }
        
        return left - 1
    }

}
