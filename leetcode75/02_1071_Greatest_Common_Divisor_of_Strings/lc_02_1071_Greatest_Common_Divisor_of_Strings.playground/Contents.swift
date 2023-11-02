import UIKit

/**
 https://leetcode.com/problems/greatest-common-divisor-of-strings
 1071. Greatest Common Divisor of Strings
 For two strings s and t, we say "t divides s" if and only if s = t + ... + t (i.e., t is concatenated with itself one or more times).

 Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

 Example 1:

 Input: str1 = "ABCABC", str2 = "ABC"
 Output: "ABC"
 Example 2:

 Input: str1 = "ABABAB", str2 = "ABAB"
 Output: "AB"
 Example 3:

 Input: str1 = "LEET", str2 = "CODE"
 Output: ""
  

 Constraints:

 1 <= str1.length, str2.length <= 1000
 str1 and str2 consist of English uppercase letters.
**/


class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str1 + str2 == str2 + str1 else {return ""}
        
        var gcdValue: Int = str1.count > str2.count ? gcd(str1.count , str2.count) :
                                                      gcd(str2.count , str1.count)
        var resultStr: String = String(str1.prefix(gcdValue))
        
        return(resultStr)
    }

    func gcd(_ a: Int,_ b: Int) -> Int{
        return b == 0 ? a : gcd(b, a % b)
    }
}


let solution: Solution = Solution()
let str1: String = "ABABABABAB"
let str2: String = "ABAB"

print("return -> \(solution.gcdOfStrings(str1,str2))")
