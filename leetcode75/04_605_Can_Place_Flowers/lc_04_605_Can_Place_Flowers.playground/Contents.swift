import UIKit

/**
 https://leetcode.com/problems/can-place-flowers
 605. Can Place Flowers
 Easy
 Topics
 Companies
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, 
 and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule and false otherwise.

 Example 1:

 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 Example 2:

 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
  

 Constraints:

 1 <= flowerbed.length <= 2 * 104
 flowerbed[i] is 0 or 1.
 There are no two adjacent flowers in flowerbed.
 0 <= n <= flowerbed.length
**/

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var indexFlowerbad: Int = 0
        var countFlowers: Int = n
        
        while (indexFlowerbad < flowerbed.count) && (countFlowers > 0) {
            if flowerbed[indexFlowerbad] == 1 {
                indexFlowerbad += 2
            } else {
                if indexFlowerbad == (flowerbed.count - 1) {
                    countFlowers -= 1
                     indexFlowerbad += 1
                } else {
                    if flowerbed[indexFlowerbad + 1] == 0 {
                        countFlowers -= 1
                        indexFlowerbad += 2
                    } else {
                        indexFlowerbad += 1
                    }
                }
            }
        }
        return (countFlowers == 0)
    }
}


let solution: Solution = Solution()

let flowerbed: [Int] = [1,0,0,0,1]
let n: Int = 1

let result = solution.canPlaceFlowers(flowerbed, n)

print("result -> \(result)")





