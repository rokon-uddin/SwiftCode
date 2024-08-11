/// Question Link: https://leetcode.com/problems/first-missing-positive/
/// Primary idea: Use a set to hold number in the array and iterate through 1...nums.count to find the missing one
/// Time Complexity: O(n), Space Complexity: O(n)
///

public struct FirstMissingPositive {
  public func firstMissingPositive(_ nums: [Int]) -> Int {
    let set = Set(nums)
    for number in 0..<nums.count {
      if !set.contains(number + 1) {
        return number + 1
      }
    }
    return nums.count + 1
  }
}
