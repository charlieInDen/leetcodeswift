class LastWordSolution {
    func lengthOfLastWord(_ s: String) -> Int {
        var res = 0
        for c in s.reversed() {
            if c == " " {
                if res > 0 {
                    return res
                }
            } else {
                res += 1
            }
        }
        return res
    }
}
