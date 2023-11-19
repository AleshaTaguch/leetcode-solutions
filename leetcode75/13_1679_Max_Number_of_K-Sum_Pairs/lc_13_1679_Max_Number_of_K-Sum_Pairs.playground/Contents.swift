import UIKit

/**
 https://leetcode.com/problems/max-number-of-k-sum-pairs/
 1679. Max Number of K-Sum Pairs
 You are given an integer array nums and an integer k.
 In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.
 Return the maximum number of operations you can perform on the array.

 Example 1:

 Input: nums = [1,2,3,4], k = 5
 Output: 2
 Explanation: Starting with nums = [1,2,3,4]:
 - Remove numbers 1 and 4, then nums = [2,3]
 - Remove numbers 2 and 3, then nums = []
 There are no more pairs that sum up to 5, hence a total of 2 operations.

 Example 2:
 
 Input: nums = [3,1,3,4,3], k = 6
 Output: 1
 Explanation: Starting with nums = [3,1,3,4,3]:
 - Remove the first two 3's, then nums = [1,4,3]
 There are no more pairs that sum up to 6, hence a total of 1 operation.
  
 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 109
 1 <= k <= 109
 **/
/*
 class Solution {
     func maxOperations(_ nums: [Int], _ k: Int) -> Int {
         let sortedNums = nums.sorted()
         var left = 0
         var right = nums.count - 1
         var result = 0

         while left < right {
             let leftVal = sortedNums[left]
             let rightVal = sortedNums[right]

             if leftVal + rightVal == k {
                 left += 1
                 right -= 1
                 result += 1
             } else if leftVal + rightVal < k {
                 left += 1
             } else {
                 right -= 1
             }
         }

         return result
     }
 }
 */
class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count>1 else {return 0}
        var resNums: [Int] = nums
        var countRes: Int = 0
        
        var aIndex: Int = 0
        var bIndex: Int = 0
        var numDif: Int
        
        while aIndex < resNums.count-1 {
            numDif = k - resNums[aIndex]
            bIndex = aIndex + 1
            print("ищем \(numDif) -> resNums[\(aIndex)] =  \(resNums[aIndex])  ")
            while bIndex < resNums.count && resNums[bIndex] != numDif  {
                print("resNums[bIndex] = \(resNums[bIndex])")
                bIndex += 1
            }
            if bIndex < resNums.count {
                print(resNums)
                print("resNums[\(aIndex)]=\(resNums[aIndex]), resNums[\(bIndex)]=\(resNums[bIndex]), k=(\(k))")
                resNums.remove(at: bIndex)
                resNums.remove(at: aIndex)
                print(resNums)
                countRes += 1
                
            } else {
                aIndex += 1
            }
        }

        return countRes
    }
}

let solution: Solution = Solution()

let nums1: [Int] = [1,2,3,4]
let nums2: [Int] = [1,1]

let k1: Int = 5

let nums: [Int] = nums1
let k: Int = k1

let startTime = CFAbsoluteTimeGetCurrent()
let res: Int = solution.maxOperations(nums,k)
let endTime   = CFAbsoluteTimeGetCurrent()
print("res = \(res)")
print("TotalTime = \(endTime-startTime)")

///res = 721777500
///TotalTime = 1.880403995513916
///TotalTime = 0.9331550598144531


