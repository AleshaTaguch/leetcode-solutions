import UIKit

/**
 https://leetcode.com/problems/can-place-flowers
 345. Reverse Vowels of a String
 Easy
 Topics
 Companies
 Given a string s, reverse only all the vowels in the string and return it.

 The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.
 
 Example 1:

 Input: s = "hello"
 Output: "holle"
 Example 2:

 Input: s = "leetcode"
 Output: "leotcede"
 
 Constraints:

 1 <= s.length <= 3 * 105
 s consist of printable ASCII characters.
**/

class Solution {
    func reverseVowels(_ s: String) -> String {
        let constrArray: [Character] = ["a", "e", "i", "o", "u","A", "E", "I", "O", "U"]
        var vowelsArray: [Character] = []
        var res: String = ""
        
        for ss in s where constrArray.contains(ss) {
            vowelsArray.append(ss)
        }
        
        guard vowelsArray.count > 0 else { return s }
        
        var vowelsIndex: Int = vowelsArray.count - 1
        for ss in s {
            if constrArray.contains(ss) {
                res.append(vowelsArray[vowelsIndex])
                vowelsIndex-=1
            } else {
                res.append(ss)
            }
        }
        
        return res
    }
}

let solution: Solution = Solution()

let str1: String = "leetcode"

let result = solution.reverseVowels(str1)

print("source -> \(str1)")
print("result -> \(result)")



