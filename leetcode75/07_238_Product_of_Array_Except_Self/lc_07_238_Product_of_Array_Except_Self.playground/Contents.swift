import UIKit

/**
 https://leetcode.com/problems/product-of-array-except-self/description/
 238. Product of Array Except Self

 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.

 Example 1:

 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 Example 2:

 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]

 Constraints:
 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)
**/
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        // вариант мой (не работает из-за сложности O(n^2) )
        /*
        var answer:[Int] = []
        var res: Int
        for (numsIndex1, numsValue1) in nums.enumerated() {
            res = 1
            for (numsIndex2, numsValue2)  in nums.enumerated() {
                if numsIndex2 != numsIndex1 {
                    res = res * numsValue2
                }
            }
            answer.append(res)
        }
        return answer
        */
        
        // вариант подсмотреный на leetcod
        /*
        var arrayA = Array(repeating: 1, count: nums.count)
        var arrayB = Array(repeating: 1, count: nums.count)
        var answer = Array(repeating: 0, count: nums.count)

        for index in 1...(nums.count - 1)  {
            arrayA[index] = arrayA[index - 1] * nums[index - 1]
        }

        for index in (0...(nums.count - 2)).reversed() {
            arrayB[index] = arrayB[index + 1] * nums[index + 1]
        }

        for index in 0...(answer.count - 1) {
            answer[index] = arrayA[index] * arrayB[index]
        }

        return answer
        */
        
        //вариант подсмотреный на leetcod и чуть чут улучшенный
        var tail   = Array(repeating: 1, count: nums.count)
        var answer = Array(repeating: 1, count: nums.count)

        for index in (0...(nums.count - 2)).reversed() {
            tail[index] = tail[index + 1] * nums[index + 1]
        }

        for index in 1...(nums.count - 1) {
            answer[index] = answer[index - 1] * nums[index - 1]
            answer[index - 1] = answer[index-1] * tail[index-1]
        }

        return answer
    }
}

let solution: Solution = Solution()
let nums: [Int] = megaNums // [1,2,3,4]
let startTime = CFAbsoluteTimeGetCurrent()
let answer = solution.productExceptSelf(nums)
let endTime   = CFAbsoluteTimeGetCurrent()

//answer.forEach{print($0)}

//2.874626040458679
//2.8670510053634644

print(endTime-startTime)

