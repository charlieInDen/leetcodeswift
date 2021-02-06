class KSolution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        var sortedNums = nums.sorted() 
        var low = 0
        var high = sortedNums[sortedNums.count - 1] - sortedNums[0]
        
        while low < high {
            var pivot = low + (high - low)/2 
            var count = 0, left = 0 
            
            for right in 0..<sortedNums.count {
                while sortedNums[right] - sortedNums[left] > pivot {
                   left += 1
                } 
                count += right - left 
            }
            
            if count >= k {
                high = pivot 
            } else {
                low = pivot + 1 
            } 
        }
        
        return low 
    }
}
