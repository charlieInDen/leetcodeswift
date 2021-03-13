class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [[Int]]() }
        let sorted = nums.sorted()
        var result = [[Int]]()
        for i in 0..<sorted.count {
            // Don't allow `i` to point to same element
            if i != 0, sorted[i] == sorted[i-1] { continue }
            var j = i + 1
            var k = sorted.count-1
            while j < k {
                let sum = sorted[i] + sorted[j] + sorted[k]
                if sum == 0 {
                    result.append([sorted[i], sorted[j], sorted[k]])
                    j += 1
                    // Don't allow `j` to point to same element
                    while j < k, sorted[j] == sorted[j-1] {
                        j += 1
                    }
                } else if sum < 0 {
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
        return result
    }
}
