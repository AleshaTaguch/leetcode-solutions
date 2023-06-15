import UIKit

/*

var greeting = "Hello, playground"


class Solution {
    
    let simbolValue: [String: Int] = ["I"  : 1,
                                      "V"  : 5,
                                      "X"  : 10,
                                      "L"  : 50,
                                      "C"  : 100,
                                      "D"  : 500,
                                      "M"  : 1000,
                                      "IV" : -1, //4,
                                      "IX" : -1, //9,
                                      "XL" : -10, //40,
                                      "XC" : -10, //90,
                                      "CD" : -100, //400,
                                      "CM" : -100 //900
                                     ]
    
    func romanToInt(_ s: String) -> Int {
        
        var result: Int = 0
        var singleCharStr: String
        var prevCharStr: String?
        var doubleCharStr: String?

        for (index, char) in s.enumerated().reversed() {
            
            singleCharStr = String(char)
            
            if let uwPrevCharStr = prevCharStr {
                doubleCharStr = String(char) + uwPrevCharStr
            } else {
                doubleCharStr = nil
            }
            
            prevCharStr = singleCharStr
                                
            if let uwDoubleCharStr = doubleCharStr,
               let intValue = simbolValue[uwDoubleCharStr] {
                result += intValue
            } else if let intValue = simbolValue[singleCharStr] {
                result += intValue
            }

        }

        return result
    }
}

let testSolution: Solution = Solution()
print(testSolution.romanToInt("III"))
print(testSolution.romanToInt("LVIII"))
print(testSolution.romanToInt("MCMXCIV"))

*/

//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    func reverseNodes(_ head: ListNode?) -> ListNode? {
        guard let uwHead = head else {return nil}
        
        var currentNode: ListNode? = head
        var reverseNode: ListNode? = ListNode(uwHead.val)
        
        while currentNode != nil {
            if let uwCurrentNode = currentNode {
                if let uwCurrentNodeNext = uwCurrentNode.next {
                    reverseNode = ListNode(uwCurrentNodeNext.val, reverseNode)
                }
                currentNode = uwCurrentNode.next
            }
        }
        
        return reverseNode
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        var originNode: ListNode? = head
        var reverseNode: ListNode? = reverseNodes(head)
        while originNode != nil && reverseNode != nil {

            if let uwOriginNode = originNode, let uwReverseNode = reverseNode {
                if uwOriginNode.val != uwReverseNode.val { return false }
                originNode = uwOriginNode.next
                reverseNode = uwReverseNode.next
            }
        }
        return true
    }
}


let node10: ListNode = ListNode(0)
let node9: ListNode = ListNode(1,node10)
let node8: ListNode = ListNode(2,node9)
let node7: ListNode = ListNode(3,node8)
let node6: ListNode = ListNode(4,node7)
let node5: ListNode = ListNode(5,node6)
let node4: ListNode = ListNode(3,node5)
let node3: ListNode = ListNode(2,node4)
let node2: ListNode = ListNode(1,node3)
let node1: ListNode = ListNode(0,node2)



//----------------------------------
print("----------------")
var currentNode: ListNode? = node1
var reverseNode: ListNode? = ListNode(node1.val)
while currentNode != nil {
    if let uwCurrentNode = currentNode {
        if let uwCurrentNodeNext = uwCurrentNode.next {
            reverseNode = ListNode(uwCurrentNodeNext.val, reverseNode)
        }
        currentNode = uwCurrentNode.next
    }
}


//----------------------------------
print("----------------")
var currentNode1: ListNode? = node1
var currentNode2: ListNode? = reverseNode
while currentNode1 != nil {

    if let uwCurrentNode1 = currentNode1, let uwCurrentNode2 = currentNode2 {
        print(uwCurrentNode1.val,uwCurrentNode2.val)
        currentNode1 = uwCurrentNode1.next
        currentNode2 = uwCurrentNode2.next
    }

}

let aa: Solution = Solution()

print(aa.isPalindrome(node1))



