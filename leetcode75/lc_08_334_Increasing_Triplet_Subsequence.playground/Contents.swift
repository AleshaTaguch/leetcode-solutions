import UIKit

/**
 https://leetcode.com/problems/increasing-triplet-subsequence/
 334. Increasing Triplet Subsequence
 Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. 
 If no such indices exists, return false.

 Example 1:

 Input: nums = [1,2,3,4,5]
 Output: true
 Explanation: Any triplet where i < j < k is valid.
 Example 2:

 Input: nums = [5,4,3,2,1]
 Output: false
 Explanation: No triplet exists.
 Example 3:

 Input: nums = [2,1,5,0,4,6]
 Output: true
 Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.

 Constraints:

 1 <= nums.length <= 5 * 105
 -231 <= nums[i] <= 231 - 1
  

 Follow up: Could you implement a solution that runs in O(n) time complexity and O(1) space complexity?
**/
class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        
        guard nums.count > 2 else {return false}
        
        var minExistLeft: [Bool] = Array(repeating: false, count: nums.count)
        var minIndex: Int = 0
        var maxIndex: Int = nums.count-1
        var resultBool: Bool = false
        var resultIndex: Int = 1
        
        for ii in 1...nums.count-2 {
            if nums[ii] <= nums[minIndex] {
                minIndex = ii
            } else {
                minExistLeft[ii] = true
            }
                
        }
        for ii in (1...nums.count-2).reversed() {
            if nums[ii] >= nums[maxIndex] {
                maxIndex = ii
            } else {
                if minExistLeft[ii] {
                    resultBool = true
                    resultIndex = ii
                    break
                }
            }
        }
        print("resultIndex = \(resultIndex)")
        return resultBool
    }
}

let solution: Solution = Solution()

let nums: [Int] = [2,1,5,0,4,6]

let result = solution.increasingTriplet(nums)

print("nums -> \(nums)")
print("result -> [\(result)]")



