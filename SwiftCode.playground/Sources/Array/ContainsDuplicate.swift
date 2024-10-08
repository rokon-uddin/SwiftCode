/// Question Link: https://leetcode.com/problems/contains-duplicate/
/// Primary idea: traverse the array and use a set to check duplicates
///
/// Time Complexity: O(n), Space Complexity: O(n)
///

public struct ContainsDuplicate {
  public func containsDuplicate(_ nums: [Int]) -> Bool {
    return nums.count > Set(nums).count
  }
}
