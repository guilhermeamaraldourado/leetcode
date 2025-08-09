/*
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this:
P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"
Write the code that will take a string and make this conversion given a number of rows:

Example 1:
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"

Example 2:
Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:
P     I    N
A   L S  I G    
Y A   H R
P     I

Example 3:
Input: s = "A", numRows = 1
Output: "A"

P       H
A     S I
y   I   R
P L     I G
A       N
*/

class Solution {

    //My partial solution
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || s.count  <= numRows{
            return s
        }

        var result = ""
        let chars = Array(s)
        let cycleLen = 2 * (numRows - 1)

        for i in 0..<numRows {
            var j = i
            var toggle = false
            while j < chars.count {
                result.append(chars[j])
                if i == 0 || i == numRows - 1 {
                    j += cycleLen
                } else {
                    let gap1 = 2 * (numRows - i - 1)
                    let gap2 = 2 * i
                    j += toggle ? gap2 : gap1
                    toggle.toggle()
                }
            }
        }
        return result
    }
}