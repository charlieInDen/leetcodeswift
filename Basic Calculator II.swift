class BCSolution {
    func calculate(_ s: String) -> Int {
        var op: Character = "+" 
        var result = 0 
        var temp = 0 
        var num = 0

        // Updates `temp` and resets `num`
        func processNum() {
            switch op {
            case "+":
                temp += num 
            case "-":
                temp -= num 
            case "*":
                temp *= num
            case "/":
                temp /= num
            default:
                break
            }
            num = 0 
        }

        // Process each character in string 
        for char in s {
            switch char {
            case "+", "-":
                processNum() 
                op = char 
                result += temp
                temp = 0  
            case "*", "/":
                processNum()
                op = char 
            case _ where char.isNumber:
                num = (num*10) + Int(String(char))!
            default:
                break
            }
        }

        // Handle last number and update result
        processNum()
        return result + temp
    }
}
