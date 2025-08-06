/*
Given a string s, return the longest palindromic substring in s.

Example 1:
Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.

Example 2:
Input: s = "cbbd"
Output: "bb"
*/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars: [Character] = Array(s)
        var result = ""
        
        for i in 0..<chars.count {
            let odd = expand(left: i, right: i)
            if odd.count > result.count {
                result = odd
            }
            let even = expand(left: i, right: i+1)
            if even.count > result.count {
                result = even
            }
        }

        func expand(left: Int, right: Int) -> String {
            var l = left
            var r = right
            while(l >= 0 && r < s.count && chars[l] == chars[r]) {
                l -= 1
                r += 1
            }
            return String(chars[(l+1)..<r])
        }

        return result
    }
}