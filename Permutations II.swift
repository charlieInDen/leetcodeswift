class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return []
        }
        
        let nums = nums.sorted()
        var result = [[Int]]()
        var candidate = [Int]()
        var visited = [Bool](repeatElement(false, count: nums.count))
        
        backtracking(&result, &candidate, nums, &visited)
        
        return result
    }
    
    func backtracking(_ result: inout [[Int]], _ candidate: inout [Int], _ nums: [Int], _ visited: inout [Bool]) {
        if candidate.count == nums.count {
            result.append(candidate)
            return
        }
        
        for i in 0..<nums.count {
            if visited[i] || (i > 0 && !visited[i - 1] && nums[i - 1] == nums[i]) {
                continue
            }
            
            visited[i] = true
            candidate.append(nums[i])
            backtracking(&result, &candidate, nums, &visited)
            visited[i] = false
            candidate.removeLast()
        }
    }
}
