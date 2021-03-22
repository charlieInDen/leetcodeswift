/*Given an m x n binary grid grid where each 1 marks the home of one friend, return the minimal total travel distance.

The total travel distance is the sum of the distances between the houses of the friends and the meeting point.

The distance is calculated using Manhattan Distance, where distance(p1, p2) = |p2.x - p1.x| + |p2.y - p1.y|.

Example 1:
Input: grid = [[1,0,0,0,1],[0,0,0,0,0],[0,0,1,0,0]]
Output: 6
Explanation: Given three friends living at (0,0), (0,4), and (2,2).
The point (0,2) is an ideal meeting point, as the total travel distance of 2 + 2 + 2 = 6 is minimal.
So return 6.
Example 2:

Input: grid = [[1,1]]
Output: 1
*/
class Solution {
    func minTotalDistance(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var rows:[Int] = []
        var cols:[Int] = []

        for i in 0..<m{
            for j in 0..<n{
                if grid[i][j] == 1{
                    rows.append(i)
                    cols.append(j)
                }
            }
        }
        let row = rows[rows.count / 2];
        cols.sort()
        let col = cols[cols.count / 2];
        var distance = 0
        for k in 0..<rows.count{
            distance += abs(cols[k]-col) + abs(rows[k]-row);
        }
        return distance
    }
}
