/// Question Link: https://leetcode.com/problems/intersection-of-two-arrays/
/// Primary idea: Use set to hold numbers for one array and iterate the other one to output result, remove the number from set to avoid duplicates.
/// Time Complexity: O(n), Space Complexity: O(n)
///

public struct IntersectionTwoArrays {
  public func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let firstSet = Set(nums1)
    let secondSet = Set(nums2)

    return Array(firstSet.intersection(secondSet))
  }
}
