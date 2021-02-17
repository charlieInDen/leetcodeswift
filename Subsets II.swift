class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var ans = Set<[Int]>()
        var comb = [Int]()
        subset(nums.sorted(), 0, &comb, &ans)
        return Array(ans)
    }
    
    func subset(_ nums: [Int], _ index: Int, _ comb: inout [Int], _ ans: inout Set<[Int]>) {
        if index >= nums.count {
            ans.insert(comb)
            
        } else {
            subset(nums, index+1, &comb, &ans)
            
            comb.append(nums[index])
            subset(nums, index+1, &comb, &ans)
            comb.removeLast()
        }
    }
}
