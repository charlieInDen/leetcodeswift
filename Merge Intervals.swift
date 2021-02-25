class MergeSolution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count < 1{
            return intervals
        }
        var intervals = intervals.sorted{$0[0] < $1[0]}
        var results = [intervals[0]] 
        
        for i in 1..<intervals.count{
            let interval = intervals[i]
            let lastIndex = results.count - 1
            if overlap(results[lastIndex], interval){
                results[lastIndex] = [min(results[lastIndex][0], interval[0]), max(results[lastIndex][1], interval[1])]
            }else{
                results.append(interval)
            }
        }
        
        return results
    }
    
    func overlap(_ a: [Int], _ b: [Int])->Bool{
        return !(b[0] > a[1])
    }
}
