/*
 Given two sorted arrays nums1 and nums2 of size m and n respectively, 
 return the median of the two sorted arrays.

Example 1:
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.

Example 2:
Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

 **/

import UIKit

class Solution {

    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var A = nums1
        var B = nums2
        if A.count > B.count {
            swap(&A, &B)
        }

        let total = A.count + B.count
        let half = total / 2

        var l = 0
        var r = A.count

        while true {
            let i = (l + r) / 2
            let j = half - i

            let Aleft = (i > 0) ? A[i - 1] : Int.min
            let Aright = (i < A.count) ? A[i] : Int.max
            let Bleft = (j > 0) ? B[j - 1] : Int.min
            let Bright = (j < B.count) ? B[j] : Int.max

            if Aleft <= Bright && Bleft <= Aright {
                if total % 2 == 1 {
                    return Double(min(Aright, Bright))
                } else {
                    return (Double(max(Aleft, Bleft)) + Double(min(Aright, Bright))) / 2.0
                }
            } else if Aleft > Bright {
                r = i - 1
            } else {
                l = i + 1
            }
        }
    }

    func findMedianSortedArray2(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var median: Double = 0
        var mergedArr: [Int] = []
        // merge the arrays
        var index1 = 0
        var index2 = 0
        
        while index1 < nums1.count && index2 < nums2.count {
            // add the lower number to mergedArr
            // could add another case to handle when they're the same number but this should work
            if nums1[index1] <= nums2[index2] {
                mergedArr.append(nums1[index1])
                index1 += 1
            } else {
                mergedArr.append(nums2[index2])
                index2 += 1
            }
        }
        // handle when one index exceeds the count but the other still has values remaining
        if index1 == nums1.count {
            mergedArr += nums2[index2...]
        }
        
        if index2 == nums2.count {
            mergedArr += nums1[index1...]
        }
        print(mergedArr)
        // if the count is odd, return the middle value
        if mergedArr.count % 2 != 0 {
            return Double(mergedArr[mergedArr.count / 2])
        } else {
            // if even, return the average of the 2 middle values
            let firstNum = Double(mergedArr[mergedArr.count / 2])
            let secondNum = Double(mergedArr[(mergedArr.count / 2) - 1])

            return (firstNum + secondNum) / 2.0000
        }

        return median
    }

    func findMedianSortedArrays3(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var arr = nums1
        arr.append(contentsOf: nums2)
        arr.sort()
        if arr.count % 2 == 0 {
            return Double(arr[arr.count / 2] + arr[arr.count / 2 - 1]) / 2
        } else {
            return Double(arr[arr.count / 2])
        }
    }
}
