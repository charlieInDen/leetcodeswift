class Solution {
    let n: Int
    var badToGood = [Int: Int]()
    init(_ N: Int, _ blacklist: [Int]) {
        var bads = Set<Int>()
        var offset = 0
        for num in blacklist {
            bads.insert(num)
            offset += 1
        }
        n = N - offset
        
        var good = N - 1
        for bad in blacklist {
            if bad < n {
                while bads.contains(good) {
                    good -= 1
                }
                badToGood[bad] = good
                good -= 1
            }
        }
    }
    
    func pick() -> Int {
        var num = Int.random(in: 0..<n)
        if let good = badToGood[num] {
            return good
        } else {
            return num
        }
    }
}
