class JumpSolution {
    
    func canJump(_ nums: [Int]) -> Bool {

        var nextReachableIndex = nums.count-1
        for i in stride(from: nums.count-2, through:0, by:-1) {

            let minimumStepsNeededToReachNextReachableIndex = nextReachableIndex - i
            if nums[i] >= minimumStepsNeededToReachNextReachableIndex {
                nextReachableIndex = i
            }
        }

        return nextReachableIndex <= 0
    }
}
