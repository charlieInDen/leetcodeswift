class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sorted = nums.sorted()
        var res = Array<[Int]>()
        if nums.count < 4{
            return res
        }
        
        for i in 0...sorted.count-4{
            //cutting branch
            if i>0 && sorted[i]==sorted[i-1]{continue}
            for j in i+1...sorted.count-3{
                //cutting branch
                if j>i+1 && sorted[j]==sorted[j-1]{continue}
                var left = j+1
                var right = sorted.count-1
                
                while left < right{
                    let sum = sorted[i]+sorted[j]+sorted[left]+sorted[right]
                    if sum == target{
                        res.append([sorted[i],sorted[j],sorted[left],sorted[right]])
                         right -= 1;
                        left += 1;
                         while sorted[right] == sorted[right+1] && left < right
                             { right -= 1 ;}
                        while sorted[left] == sorted[left-1] && left < right
                             { left += 1 ;}
                    }
                    else if sum > target {
                        right -= 1
                    }
                    else {
                        left += 1
                    }
                } 
            }
        }
        return res
    }
}
