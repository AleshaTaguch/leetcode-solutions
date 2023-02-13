import UIKit

var greeting = "Hello, playground"


class Solution {
    
    let simbolValue: [String: Int] = ["I"  : 1,
                                      "V"  : 5,
                                      "X"  : 10,
                                      "L"  : 50,
                                      "C"  : 100,
                                      "D"  : 500,
                                      "M"  : 1000,
                                      "IV" : -1, //4,
                                      "IX" : -1, //9,
                                      "XL" : -10, //40,
                                      "XC" : -10, //90,
                                      "CD" : -100, //400,
                                      "CM" : -100 //900
                                     ]
    
    func romanToInt(_ s: String) -> Int {
        
        var result: Int = 0
        var singleCharStr: String
        var prevCharStr: String?
        var doubleCharStr: String?

        for (index, char) in s.enumerated().reversed() {
            
            singleCharStr = String(char)
            
            if let uwPrevCharStr = prevCharStr {
                doubleCharStr = String(char) + uwPrevCharStr
            } else {
                doubleCharStr = nil
            }
            
            prevCharStr = singleCharStr
                                
            if let uwDoubleCharStr = doubleCharStr,
               let intValue = simbolValue[uwDoubleCharStr] {
                result += intValue
            } else if let intValue = simbolValue[singleCharStr] {
                result += intValue
            }

        }

        return result
    }
}

let testSolution: Solution = Solution()
print(testSolution.romanToInt("III"))
print(testSolution.romanToInt("LVIII"))
print(testSolution.romanToInt("MCMXCIV"))



