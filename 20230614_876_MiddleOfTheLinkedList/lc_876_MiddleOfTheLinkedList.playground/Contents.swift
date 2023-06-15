import UIKit

/**
 https://leetcode.com/problems/middle-of-the-linked-list/
 Given the head of a singly linked list, return the middle node of the linked list.

 If there are two middle nodes, return the second middle node.
 
 Example 1:
 Input: head = [1,2,3,4,5]
 Output: [3,4,5]
 Explanation: The middle node of the list is node 3.

 Example 2:
 Input: head = [1,2,3,4,5,6]
 Output: [4,5,6]
 Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
  

 Constraints:

 The number of nodes in the list is in the range [1, 100].
 1 <= Node.val <= 100
 
*/


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


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var currentNode: ListNode?
        var resultNode: ListNode?

        currentNode = headNode
        resultNode = headNode
        while currentNode != nil {
            if let uwCurrentNode1 = currentNode {
                currentNode = uwCurrentNode1.next
                if let uwResultNode = resultNode, let uwCurrentNode2 = currentNode {
                    resultNode = uwResultNode.next
                    currentNode = uwCurrentNode2.next
                }
            }
            
        }
        
        return resultNode
    }
}

let nodeArray: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
var headNode: ListNode?

for item in nodeArray.reversed() {
    print(item)
    headNode = ListNode(item,headNode)
}

var currentNode: ListNode?
var resultNode: ListNode?

print("----------")
currentNode = headNode
resultNode = headNode
while currentNode != nil {
    if let uwCurrentNode1 = currentNode {
        print(uwCurrentNode1.val)
        currentNode = uwCurrentNode1.next
        if let uwResultNode = resultNode, let uwCurrentNode2 = currentNode {
            resultNode = uwResultNode.next
            currentNode = uwCurrentNode2.next
        }
    }
    
}
print("----------")
print(resultNode?.val)
print("----------")

let testSolution: Solution = Solution()
let resTest: ListNode? = testSolution.middleNode(headNode)
print(resTest?.val)

