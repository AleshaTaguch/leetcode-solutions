import UIKit

/**
 https://leetcode.com/problems/move-zeroes/
 283. Move Zeroes
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.

 Example 1:
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]

 Example 2:
 Input: nums = [0]
 Output: [0]

 Constraints:
 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1

 Follow up: Could you minimize the total number of operations done?
 **/

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var index: Int = 0
        for nn in nums where nn != 0 {
            nums[index]=nn
            index += 1
        }
        guard index<nums.count else {return}
        for ii in index...nums.count - 1 {
            nums[ii] = 0
        }
        return
    }
}

let solution: Solution = Solution()

var nums: [Int] = [1,0,1,0,3,12]
print("nums ->",nums)

solution.moveZeroes(&nums)
print("nums ->",nums)





