class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        var candidate = [Int]()
        
        backtracking(&result, &candidate, 1, n, k)
        
        return result
    }
    
    private func backtracking(_ result: inout [[Int]], _ candidate: inout [Int], _ start: Int, _ n: Int, _ k: Int) {
        if k == 0 {
            result.append(candidate)
            return
        }
        if start > n {
            return
        }
        
        for i in start...n {
            candidate.append(i)
            backtracking(&result, &candidate, i + 1, n, k - 1)
            candidate.removeLast()
        }
    }
}
