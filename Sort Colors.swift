class Solution {
    func sortColors(_ nums: inout [Int]) {
        var i = 0
        var j = 0
        var k = nums.count - 1
        while j <= k {
            switch nums[j] {
            case 0:
                nums.swapAt(i, j)
                i = i + 1
                j = j + 1
            case 1:
                j = j + 1
            case 2:
                nums.swapAt(j, k)
                k = k - 1
            default:
                print("None")
            }
        }
    }
}
