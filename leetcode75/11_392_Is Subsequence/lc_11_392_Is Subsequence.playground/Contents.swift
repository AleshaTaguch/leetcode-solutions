import UIKit

/**
 https://leetcode.com/problems/is-subsequence/
 392. Is Subsequence
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

 Example 1:

 Input: s = "abc", t = "ahbgdc"
 Output: true
 Example 2:

 Input: s = "axc", t = "ahbgdc"
 Output: false

 Constraints:

 0 <= s.length <= 100
 0 <= t.length <= 104
 s and t consist only of lowercase English letters.

 Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?
 **/

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sArray: [Character] = Array(s)
        let tArray: [Character] = Array(t)
        var sIndex: Int = 0
        var tIndex: Int = 0
        
        while sIndex < sArray.count && tIndex < tArray.count {
            print(sArray[sIndex], tArray[tIndex])
            if sArray[sIndex] == tArray[tIndex] {
                sIndex += 1
            }
            tIndex += 1
        }
        
        
        return sIndex == sArray.count
    }
}

let solution: Solution = Solution()

var s: String = "abc"
var t: String = "ahbgdc"

print(solution.isSubsequence(s,t))






