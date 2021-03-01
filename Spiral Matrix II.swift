class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
      // create the matrix, fill with 0
      var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
      var left = 0, right = n - 1, top = 0, bottom = n - 1
      var direction = 0
      var element = 1
      let size = n*n

      while element <= size {
        if direction == 0 {         // left -> right
          for i in left...right { 
            matrix[top][i] = element
            element += 1
          }
          top += 1
        } else if direction == 1 {  // top -> bottom
          for i in top...bottom { 
            matrix[i][right] = element
            element += 1
          }
          right -= 1
        } else if direction == 2 {  // right -> left
          for i in stride(from: right, through: left, by: -1) {
            matrix[bottom][i] = element
            element += 1
          }
          bottom -= 1
        } else {        // bottom -> top
          for i in stride(from: bottom, through: top, by: -1) {
            matrix[i][left] = element
            element += 1
          }
          left += 1
        }
        direction += direction == 3 ? -3 : 1
      }

      return matrix
    }
}
