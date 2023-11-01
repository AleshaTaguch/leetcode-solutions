import UIKit

/**
 https://leetcode.com/problems/merge-strings-alternately/description/?envType=study-plan-v2&envId=leetcode-75
 1768. Merge Strings Alternately
 You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1. If a string is longer than the other, append the additional letters onto the end of the merged string.

 Return the merged string.
 
 Example 1:

 Input: word1 = "abc", word2 = "pqr"
 Output: "apbqcr"
 Explanation: The merged string will be merged as so:
 word1:  a   b   c
 word2:    p   q   r
 merged: a p b q c r
 Example 2:

 Input: word1 = "ab", word2 = "pqrs"
 Output: "apbqrs"
 Explanation: Notice that as word2 is longer, "rs" is appended to the end.
 word1:  a   b
 word2:    p   q   r   s
 merged: a p b q   r   s
 Example 3:

 Input: word1 = "abcd", word2 = "pq"
 Output: "apbqcd"
 Explanation: Notice that as word1 is longer, "cd" is appended to the end.
 word1:  a   b   c   d
 word2:    p   q
 merged: a p b q c   d
  

 Constraints:

 1 <= word1.length, word2.length <= 100
 word1 and word2 consist of lowercase English letters.
**/

class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let word1Array: [Character] = Array(word1)
        let word2Array: [Character] = Array(word2)
        var result: String = ""
        
        for index in 0...min(word1Array.count, word2Array.count)-1  {
            result = result + String (word1Array[index]) + String (word2Array[index])
        }

        if word1Array.count > word2Array.count {
            for index in (word2Array.count )...(word1Array.count - 1) {
                result = result + String (word1Array[index])
            }
        } else if word1Array.count < word2Array.count {
            for index in (word1Array.count )...(word2Array.count - 1) {
                result = result + String (word2Array[index])
            }
        }
        
        return result
    }
}

let solution: Solution = Solution()

var str1: String = "asdfg"
var str2: String = "qwerwpoiu"

print("str1 -> \(str1)")
print("str2 -> \(str2)")

print("return -> \(solution.mergeAlternately(str1,str2))")

