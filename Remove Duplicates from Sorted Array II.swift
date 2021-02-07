class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var num = Int.min
        var count = 0
        var counter = 0
        var index = 0
        while index != nums.count {
            let number = nums[index]
            if num == number && count < 2 {
                counter = counter + 1
                count = count + 1
            } else if num != number {
                num = number
                count = 1
                counter += 1
            } else {
                nums.remove(at: index)
                index = index - 1
            }
            index = index + 1
        }
        return counter
    }
}
