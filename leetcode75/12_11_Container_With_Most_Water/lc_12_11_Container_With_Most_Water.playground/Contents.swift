import UIKit

/**
 https://leetcode.com/problems/container-with-most-water/
 11. Container With Most Water
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
 Find two lines that together with the x-axis form a container, such that the container contains the most water.
 Return the maximum amount of water a container can store.
 Notice that you may not slant the container.

 Example 1:
 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

 Example 2:
 Input: height = [1,1]
 Output: 1
  
 Constraints:

 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104
 **/
/*
 // это решение из leetcode
 class Solution {
     func maxArea(_ height: [Int]) -> Int {
         var maxArea = 0
         var left = 0
         var right = height.count - 1

         while left < right {
             var area = min(height[left], height[right]) * (right - left)
             maxArea = max(maxArea, area)

             if height[left] < height[right] {
                 left += 1
             } else {
                 right -= 1
             }
         }

         return maxArea
     }
 }

*/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count>1 else {return 0}
        var maxVolume:Int = 0
        var curValume:Int = 0
        var indexLeft: Int = 0
        var indexRight: Int = height.count-1
        var indexNewPos: Int
        
        while indexLeft < indexRight {
            curValume = min(height[indexLeft],height[indexRight]) * (indexRight-indexLeft)
            if curValume > maxVolume {
                maxVolume = curValume
            }
            
            indexNewPos = indexLeft
            if height[indexLeft]<height[indexRight] {
                indexNewPos = indexLeft + 1
                while height[indexNewPos] <= height[indexLeft] && indexNewPos < indexRight {
                    indexNewPos += 1
                }
                indexLeft = indexNewPos
            } else {
                indexNewPos = indexRight - 1
                while height[indexNewPos] <= height[indexRight] && indexLeft < indexNewPos {
                    indexNewPos -= 1
                }
                indexRight = indexNewPos
            }
        }
        return maxVolume
    }
}

let solution: Solution = Solution()

let nums1: [Int] = [1,8,6,2,5,4,8,3,7]
let nums2: [Int] = [1,1]

let nums: [Int] = bigNumsArray
let startTime = CFAbsoluteTimeGetCurrent()
let res: Int = solution.maxArea(nums)
let endTime   = CFAbsoluteTimeGetCurrent()
print("res = \(res)")
print("TotalTime = \(endTime-startTime)")

///res = 721777500
///TotalTime = 1.880403995513916
///TotalTime = 0.9331550598144531


