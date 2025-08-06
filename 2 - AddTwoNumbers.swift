/*
You are given two non-empty linked lists representing two non-negative integers. 
The digits are stored in reverse order, and each of their nodes contains a single digit.
Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example 1
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.

Example 2:
Input: l1 = [0], l2 = [0]
Output: [0]

Example 3:
Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
*/

import UIKit

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var answer: ListNode? = ListNode()
        var current = answer
        var carry: Int = 0
        var l1Copy = l1
        var l2Copy = l2
        
        while(l1Copy != nil || l2Copy != nil || carry != 0) {
            var l1Value = 0
            var l2Value = 0
            if let l1Copy {
                l1Value = l1Copy.val
            }
            if let l2Copy {
                l2Value = l2Copy.val
            }
            let total = l1Value + l2Value + carry
            current?.next = ListNode(total % 10)
            carry = total / 10
            
            if let next = l1Copy?.next {
                l1Copy = next
            } else {
                l1Copy = nil
            }

            if let next = l2Copy?.next {
                l2Copy = next
            } else {
                l2Copy = nil
            }

            current = current?.next
        }
        
        return answer?.next
    }

    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var temp = dummy
        var carry = 0
        
        var l1Current = l1
        var l2Current = l2
        
        while l1Current != nil || l2Current != nil || carry != 0 {
            let val1 = l1Current?.val ?? 0
            let val2 = l2Current?.val ?? 0
            
            let sum = val1 + val2 + carry
            carry = sum / 10
            temp.next = ListNode(sum % 10)
            temp = temp.next!
            
            l1Current = l1Current?.next
            l2Current = l2Current?.next
        }
        
        return dummy.next
    }
}
