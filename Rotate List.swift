/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class RotateSolution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        guard head?.next != nil else { return head }

        var fastPointer: ListNode? = head
        var slowPointer: ListNode? = head
        var lengthOfList = 0
        
        while fastPointer != nil {
            lengthOfList += 1
            fastPointer = fastPointer?.next
        }
        
        fastPointer = head
        let localK = k % lengthOfList
        for _ in 0 ..< localK {
            fastPointer = fastPointer?.next
        }
        
        while fastPointer?.next != nil {
            fastPointer = fastPointer?.next
            slowPointer = slowPointer?.next
        }
        
        fastPointer?.next = head
        let newHead = slowPointer?.next
        slowPointer?.next = nil
        return newHead
    }
}
