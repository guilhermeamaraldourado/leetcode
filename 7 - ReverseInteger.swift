/*
 Given a signed 32-bit integer x, return x with its digits reversed.
 If reversing x causes the value to go outside the signed 32-bit integer range [-2^31, 2^31 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

 Example 1:
 Input: x = 123
 Output: 321
 
 Example 2:
 Input: x = -123
 Output: -321
 
 Example 3:
 Input: x = 120
 Output: 21
 */

class Solution {

    //My Solution
    func reverse(_ x: Int) -> Int {
        if x < 10 && x >= -9 {
            return x
        }
        var c = x
        var b = 0
        while abs(c) > 10 {
            let a = c % 10
            b = (b + a) * 10
            c = c / 10
        }
        let e = b + c
        if abs(e) > Int32.max {
            return 0
        }
        return e
    }
}
