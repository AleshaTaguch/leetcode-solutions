import UIKit

/**
https://leetcode.com/problems/ransom-note/description/
Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
Each letter in magazine can only be used once in ransomNote.
 
 Example 1:

 Input: ransomNote = "a", magazine = "b"
 Output: false
 Example 2:

 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 Example 3:

 Input: ransomNote = "aa", magazine = "aab"
 Output: true
 
*/

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        let charFromNote: [Character] = ransomNote.sorted()
        let charFromMag: [Character] = magazine.sorted()
        
        var indexNote: Int = 0
        var indexMag: Int = 0
        while indexNote <= charFromNote.count-1 && indexMag <= charFromMag.count-1 {
            if charFromNote[indexNote] == charFromMag[indexMag] {
                indexNote += 1
            }
            indexMag += 1
        }
        
        return indexNote == charFromNote.count
    }
}

let solution = Solution()
print(solution.canConstruct("a", "b"))
print(solution.canConstruct("aa", "ab"))
print(solution.canConstruct("aa", "aab"))



