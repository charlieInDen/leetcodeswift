class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var source = Array(1...n)
        var k = k - 1
        var result = ""
        while source.count > 0 {
            let base = Amm(source.count - 1)
            let idx = k / base
            result += String(source[idx])
            source.remove(at: idx)
            k = k % base
        }
        return result
    }
    
    func Amm(_ m: Int) -> Int {
        guard m >= 1 else { return 1 }
        return (1...m).reduce(1, *)
    }
}
