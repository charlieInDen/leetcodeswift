class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        guard nums.isEmpty == false else {
            return 1
        }
        var set = Set(nums)
        var index = 1 
        var max = nums.max() ?? 0
        if max <= 0 {
            return 1
        }
        while index < max {
            if !set.contains(index) {
                return index
            }
            index += 1
        }
        return max + 1
    }
}
