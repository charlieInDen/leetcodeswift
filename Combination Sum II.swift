class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var sortNums = candidates.sorted() 
        var tmp = [Int]()  // current set for testing
        var rlt = [[Int]]() // the result set
        backtrack(&sortNums, &tmp, 0, target, &rlt)
        return rlt
    }
// subtrack a num from candidates to find the combination: 
    func backtrack(_ nums: inout [Int], _ tmp: inout [Int], _ start:Int, _ tg:Int, _ rlt:inout[[Int]]) {
        if tg==0 { // find one and put into result; 
            rlt.append(tmp)
            return
        }
        if start >= nums.count || nums[start] > tg { return } // go on condictions
        for i in start...nums.count-1 {
            if tg < nums[i] { return }
            if i != start && nums[i]==nums[i-1] { continue } // skip the same num been used
            tmp.append(nums[i])
            backtrack(&nums, &tmp, i+1, tg-nums[i], &rlt) 
            tmp.removeLast()
        }
    }
}
