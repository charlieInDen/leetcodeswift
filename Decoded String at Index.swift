class Solution {
    func decodeAtIndex(_ S: String, _ K: Int) -> String {
        let c = S.count, S = S.map({ Int($0.asciiValue ?? 97) - 48 }) // "1"..."9" -> 1...9, "a"..."z" -> 49...74
        var len = 0, K = K, stack = [(Int, Int)]()
		// first pass to form stack
        for item in S where len < K {
            if item < 10 { // digit
                stack.append((-1, item))
                len *= item
            } else { // letter
                stack.append((item, 1))
                len += 1
            }
        }
		// second pass to find result
        while !stack.isEmpty {
            let (char, count) = stack.removeLast()
            if char > 0 { // letter
                if len == K {
                    return String(Unicode.Scalar(UInt8(char + 48)))
                } else {
                    len -= count
                }
            } else { // digit
                len /= count
                K = K % len == 0 ? len : K % len
            }
        }
        return ""
    }
}
