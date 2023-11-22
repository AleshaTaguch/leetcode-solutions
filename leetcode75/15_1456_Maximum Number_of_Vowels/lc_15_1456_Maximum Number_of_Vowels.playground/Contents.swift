import UIKit

/**
 https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length
 1456. Maximum Number of Vowels in a Substring of Given Length
 Given a string s and an integer k, return the maximum number of vowel letters in any substring of s with length k.
 Vowel letters in English are 'a', 'e', 'i', 'o', and 'u'.

 Example 1:
 Input: s = "abciiidef", k = 3
 Output: 3
 Explanation: The substring "iii" contains 3 vowel letters.

 Example 2:
 Input: s = "aeiou", k = 2
 Output: 2
 Explanation: Any substring of length 2 contains 2 vowels.

 Example 3:
 Input: s = "leetcode", k = 3
 Output: 2
 Explanation: "lee", "eet" and "ode" contain 2 vowels.

 Constraints:
 1 <= s.length <= 105
 s consists of lowercase English letters.
 1 <= k <= s.length
 **/
class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let charArray: [Character] = Array(s)
        var boolArray: [Bool] = Array(repeating: false, count: charArray.count)
        let vowelsArray: [Character]  = ["a","e","i","o","u"]
        
        var indexVowel: Int = 0
        var countVowel: Int = 0
        var maxCountVowel: Int = 0
        
        while indexVowel < charArray.count && maxCountVowel < k {
            boolArray[indexVowel] = vowelsArray.contains(charArray[indexVowel])
            
            if boolArray[indexVowel] {
                countVowel += 1
            }
            
            if indexVowel >= k {
                
                if boolArray[indexVowel-k] {
                    countVowel -= 1
                }
            }
            
            if countVowel > maxCountVowel {
                maxCountVowel = countVowel
            }

            print(indexVowel,countVowel,maxCountVowel)
            indexVowel += 1
        }
        
        return maxCountVowel
    }
}

let solution: Solution = Solution()

let s: String = "abciiidef"
let k: Int = 3

let startTime = CFAbsoluteTimeGetCurrent()
let res = solution.maxVowels(s,k)
let endTime   = CFAbsoluteTimeGetCurrent()
print("res = \(res)")
print("TotalTime = \(endTime-startTime)")



