/*
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]
*/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seen: [Int: Int] = [:]
        for i in 0..<nums.count {
            let diff = target - nums[i]
            if seen.keys.contains(diff) {
                return [seen[diff]!, i]
            } else {
                seen[nums[i]] = i
            }
        }
        return []
    }

    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        let n = nums.count

        for i in 0 ..< n {
            for j in i + 1 ..< n {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
    
        return []
    }

    func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
        let sortedNums = nums.sorted()
        var left = 0
        var right = nums.count - 1

        while left < right {
            let sum = sortedNums[left] + sortedNums[right]
            if sum == target {
                if let index1 = nums.firstIndex(of: sortedNums[left]),
                   let index2 = nums.lastIndex(of: sortedNums[right]) {
                return [index1, index2]
                }
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }

        return []
    }
}