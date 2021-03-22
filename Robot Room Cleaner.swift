/**
 * // This is the robot's control interface.
 * // You should not implement it, or speculate about its implementation
 * public class Robot {
 *     // Returns true if the cell in front is open and robot moves into the cell.
 *     // Returns false if the cell in front is blocked and robot stays in the current cell.
 *     public func move() -> Bool {}
 *
 *     // Robot will stay in the same cell after calling turnLeft/turnRight.
 *     // Each turn will be 90 degrees.
 *     public func turnLeft() {}
 *     public func turnRight() {}
 *
 *     // Clean the current cell.
 *     public func clean() {}
 * }
 */

class Solution {
    func cleanRoom(_ robot: Robot) {
        // Directions: 0 (up), 1 (right), 2 (down), 3 (left)
        var visited = Set<[Int]>()
        var directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]

        /// Returns to previous position and orientation
        func back() {
            robot.turnRight()
            robot.turnRight()
            _ = robot.move()
            robot.turnRight()
            robot.turnRight() 
        }

        /// Performs DFS / Backtracking 
        func helper(_ curr: [Int], _ dir: Int) {
            visited.insert(curr)
            robot.clean() 

            for i in 0 ..< 4 {
                let newDir = (dir + i) % 4 
                let nextCell = [
                    curr[0] + directions[newDir][0],
                    curr[1] + directions[newDir][1]
                ]

                if !visited.contains(nextCell) && robot.move() {
                    helper(nextCell, newDir)
                    back() 
                }

                robot.turnRight()
            }
        }

        // Start from [0, 0] moving in the up direction
        helper([0,0], 0)
    }
}
