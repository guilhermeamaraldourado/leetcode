import UIKit

/*
 Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer.

 The algorithm for myAtoi(string s) is as follows:

 Whitespace: Ignore any leading whitespace (" ").
 Signedness: Determine the sign by checking if the next character is '-' or '+', assuming positivity if neither present.
 Conversion: Read the integer by skipping leading zeros until a non-digit character is encountered or the end of the string is reached. If no digits were read, then the result is 0.
 Rounding: If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then round the integer to remain in the range. Specifically, integers less than -231 should be rounded to -231, and integers greater than 231 - 1 should be rounded to 231 - 1.
 Return the integer as the final result.

 Example 1:
 Input: s = "42"
 Output: 42

 Example 2:
 Input: s = " -042"
 Output: -42

 Example 3:
 Input: s = "1337c0d3"
 Output: 1337

 Example 4:
 Input: s = "0-1"
 Output: 0

 Example 5:
 Input: s = "words and 987"
 Output: 0
**/

class Solution {

    //My Solution
    func myAtoi(_ s: String) -> Int {
        let chars: [Character] = Array(s)
        var result = ""
        var firstNumberFound = false
        var firstSymbolFound = false
        
        func isNumber(_ char: Character) -> Bool {
            let numbers: [Character] = ["1", "2", "3", "4", "5", "6","7", "8", "9", "0"]
            return numbers.contains(char)
        }
        func isSymbol(_ char: Character) -> Bool {
            let operations: [Character] = ["-", "+"]
            return operations.contains(char)
        }
        
        func checkSize(res: Int) -> (finished: Bool, value: Int) {
            if res < Int32.min {
                return (true, Int(Int32.min))
            }
            if res > Int32.max {
                return (true, Int(Int32.max))
            }
            return (false, res)
        }

        guard let first = chars.first,
              (isNumber(first) || isSymbol(first) || first == " ") else {
            return 0
        }

        for i in 0..<chars.count {
            if firstNumberFound || firstSymbolFound {
                if !isNumber(chars[i]) {
                    break
                }
                if i == chars.count-1 {
                    if isNumber(chars[i]) {
                        result.append(chars[i])
                    }
                    break
                }
            }
            if chars[i].isNumber {
                firstNumberFound = true
                result.append(chars[i])
                if let res = Int(result) {
                    let check = checkSize(res: res)
                    if check.finished {
                        return check.value
                    }
                }
            } else if isSymbol(chars[i]), firstNumberFound == false {
                firstSymbolFound = true
                result.append(chars[i])
            } else if chars[i] == " " {
                if result.count > 0 {
                    return 0
                }
            } else {
                return 0
            }
        }

        if let res = Int(result) {
            return checkSize(res: res).value
        }
        return 0
    }

    func myAtoi2(_ s: String) -> Int {
        // Step 1: Trim leading whitespace
        let str = s.trimmingCharacters(in: .whitespaces)
        // If the string is empty after trimming, return 0
        guard !str.isEmpty else { return 0 }
        
        var sign = 1
        var result = 0
        var i = str.startIndex
        
        // Step 2: Check for signs ('+' or '-') and set the sign variable
        if str[i] == "+" || str[i] == "-" {
            sign = str[i] == "-" ? -1 : 1
            i = str.index(after: i) // Move to the next character
        }
        
        // Step 3: Iterate through the remaining characters
        while i < str.endIndex, str[i].isNumber {
            let digit = Int(String(str[i]))!
            
            // Step 4: Handle integer overflow
            if result > (Int(Int32.max) - digit) / 10 {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
            
            // Convert the digit to an integer and update the result
            result = result * 10 + digit
            i = str.index(after: i) // Move to the next character
        }
        
        // Step 5: Return the final integer result with the appropriate sign
        return sign * result
    }

}
