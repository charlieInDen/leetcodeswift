class Solution {
    func grayCode(_ n: Int) -> [Int] {
        var result = [Int]()
        var i: Int = 0
        while i < (1 << n) {
            result.append( i ^ (i >> 1))
            i += 1
        }
        return result
    }
}
