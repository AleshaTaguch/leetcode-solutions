import UIKit

/**
 https://leetcode.com/problems/maximum-average-subarray-i/
 643. Maximum Average Subarray I
 You are given an integer array nums consisting of n elements, and an integer k.
 Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

 Example 1:
 Input: nums = [1,12,-5,-6,50,3], k = 4
 Output: 12.75000
 Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

 Example 2:
 Input: nums = [5], k = 1
 Output: 5.00000

 Constraints:
 n == nums.length
 1 <= k <= n <= 105
 -104 <= nums[i] <= 104
 **/
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        guard k <= nums.count else {return 0}
        
        var sum: Int = 0
        var doubleK: Double = Double(k)
        var avgMax: Double = 0

        for index in 0...k - 1 {
            sum += nums[index]
        }
        avgMax = Double(sum) / doubleK
        
        guard k < nums.count else {return avgMax}
        
        for index in k...nums.count-1 {
            sum = sum - nums[index - k] + nums[index]
            avgMax = max(avgMax, Double(sum) / doubleK )
        }

        return avgMax
    }
}

let solution: Solution = Solution()

let nums1: [Int] = [1] //,12,-5,-6,50,3]

let k1: Int = 1

let nums: [Int] = nums1
let k: Int = k1

let startTime = CFAbsoluteTimeGetCurrent()
let res: Double = solution.findMaxAverage(nums,k)
let endTime   = CFAbsoluteTimeGetCurrent()
print("res = \(res)")
print("TotalTime = \(endTime-startTime)")

///res = 721777500
///TotalTime = 1.880403995513916
///TotalTime = 0.9331550598144531

