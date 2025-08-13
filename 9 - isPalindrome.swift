/*
Given an integer x, return true if x is a palindrome, and false otherwise.

Example 1:
Input: x = 121
Output: true
Explanation: 121 reads as 121 from left to right and from right to left.
                                    
Example 2:
Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
                                
Example 3:
Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
*/

//My Solution
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let s = Array(String(x))
        var i = 0
        var j = s.count
        
        if x < 0 {
            return false
        }
        if x < 10 {
            return true
        }
        while i <= j {
            if s[i] == s[j - 1] {
                i += 1
                j -= 1
            } else {
                return false
            }
        }
        
        return true
    }
}
