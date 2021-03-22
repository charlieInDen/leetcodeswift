class Solution {
    func employeeFreeTime(_ schedule: [[Interval]]) -> [Interval] {
        var result = [Interval]()
        if(schedule.count == 1 || schedule[0].count == 1) {
            return result
        }
        
        var startPoints = [Int]()
        var endPoints = [Int]()
        
        for intervals in schedule {
            for interval in intervals {
                startPoints.append(interval.start)
                endPoints.append(interval.end)
            }
        }
        startPoints.sort()
        endPoints.sort()
        
        let n = startPoints.count
        for i in 0..<n - 1 {
            if(startPoints[i+1] > endPoints[i]) {
                result.append(Interval(endPoints[i],startPoints[i+1]))
            }
        }
        return result
    }
}
