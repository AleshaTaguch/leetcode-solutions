import UIKit

/**
 https://leetcode.com/problems/fizz-buzz/description/
 Given an integer n, return a string array answer (1-indexed) where:

 answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
 answer[i] == "Fizz" if i is divisible by 3.
 answer[i] == "Buzz" if i is divisible by 5.
 answer[i] == i (as a string) if none of the above conditions are true.
 
 Example 1:

 Input: n = 3
 Output: ["1","2","Fizz"]
 Example 2:

 Input: n = 5
 Output: ["1","2","Fizz","4","Buzz"]
 Example 3:

 Input: n = 15
 Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
 
*/

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var resArray: [String] = []
        var dev3: Int
        var dev5: Int
        for index in 1...n {
            dev3 = index % 3
            dev5 = index % 5
            if dev3 == 0 && dev5 == 0  {
                resArray.append("FizzBuzz")
            } else if dev3 == 0 {
                resArray.append("Fizz")
            } else if dev5 == 0 {
                resArray.append("Buzz")
            } else {
                resArray.append(String(index))
            }
        }
        
        return resArray
    }
}

let solution = Solution()
print(solution.fizzBuzz(3))
print(solution.fizzBuzz(5))
print(solution.fizzBuzz(15))



