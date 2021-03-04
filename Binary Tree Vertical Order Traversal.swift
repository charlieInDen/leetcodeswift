///https://leetcode.com/problems/binary-tree-vertical-order-traversal/
class Solution {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        
		//Check base case
        if root == nil {
            return []
        } 
        
        var result: [[Int]] = [] 
        var lookup: [Int: [Int]] = [:] 
        var queue:[(TreeNode?, Int)] = []
        
		//Start BFS Process
        queue.append((root!,0))
        
        while !queue.isEmpty {
            let node = queue.removeFirst() 
            let treeNode = node.0  
            let column = node.1
        
            if treeNode != nil {
                if let nodeValues = lookup[column] {
                    lookup[column]!.append(treeNode!.val)
                } else {
                    lookup[column] = [] 
                    lookup[column]!.append(treeNode!.val)
                }
				
                queue.append((treeNode?.left, column - 1))
                queue.append((treeNode?.right, column + 1))
            } 
        }
         
		//Sort the columns
        let sortedKeys = lookup.keys.sorted() 
        
		//Go through sorted columns and get the nodeValues via lookup and append result. 
        for key in sortedKeys {
            if let nodeValues = lookup[key] {
                result.append(nodeValues)
            } 
        } 
        
        return result
    }
}
