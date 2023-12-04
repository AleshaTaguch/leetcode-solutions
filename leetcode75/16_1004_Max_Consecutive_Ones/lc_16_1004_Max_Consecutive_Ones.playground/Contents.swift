import UIKit

/**
 https://leetcode.com/problems/max-consecutive-ones-iii/
 1004. Max Consecutive Ones III
 Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

 Example 1:
 Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
 Output: 6
 Explanation: [1,1,1,0,0,1,1,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.

 Example 2:
 Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
 Output: 10
 Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.

 Constraints:
 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 0 <= k <= nums.length
 **/
class Solution {
    func longestOnes(_ nums: [Int], _ k: Int, _ solutionOption: Int) -> Int {
        var count1: Int = 0
        var count0: Int = 0
        var tailIndex: Int = 0
        var maxCount1: Int = 0
        
        if solutionOption == 2 {
            
            for headIndex in 0...nums.count-1 {
                count1 += 1
                if nums[headIndex] == 0 {
                    count0 += 1
                }
                //print("\(tailIndex)<-->\(headIndex) c1=\(count1) c0=\(count0)")
                while count0 > k {
                    if  nums[tailIndex] == 0 {
                        count0 -= 1
                    }
                    count1 -= 1
                    tailIndex += 1
                    //print("\(tailIndex)<-->\(headIndex) c1=\(count1) c0=\(count0)")
                }
                if count1 > maxCount1 {
                    maxCount1 = count1
                }
            }
            
        }
        
        if solutionOption == 1 {
            
            for startIndex in 0...nums.count-1 {
                count1 = 0
                count0 = 0
                for curIndex in startIndex...nums.count-1 {
                    if nums[curIndex] == 1 {
                        count1 += 1
                    } else {
                        if count0 < k {
                            count0 += 1
                        } else {
                            if count1 + count0 > maxCount1 {
                                maxCount1 = count1 + count0
                            }
                            count1 = 0
                            count0 = 0
                        }
                    }
                }
            }
            
        }
        return maxCount1
    }
}

let solution: Solution = Solution()

let nums: [Int] = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1]
let k: Int = 3

let startTime1 = CFAbsoluteTimeGetCurrent()
let res1 = solution.longestOnes(nums, k, 1)
let endTime1   = CFAbsoluteTimeGetCurrent()
print("res = \(res1)")
print("TotalTime = \(endTime1-startTime1)")

let startTime2 = CFAbsoluteTimeGetCurrent()
let res2 = solution.longestOnes(nums, k, 2)
let endTime2   = CFAbsoluteTimeGetCurrent()
print("res = \(res2)")
print("TotalTime = \(endTime2-startTime2)")

// вариант мой
// TotalTime = 0.011824965476989746

// вариант от leetcode

