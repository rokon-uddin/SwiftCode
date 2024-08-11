/// Question Link: https://leetcode.com/problems/move-zeroes/
/// Primary idea: keep index for element not equal to 0, traverse and set up the index
///
/// Time Complexity: O(n), Space Complexity: O(1)
///

public struct MoveZeroes {
  public func moveZeroes(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }
    var index = 0
    for num in nums where num != 0 {
      nums[index] = num
      index += 1
    }

    while index < nums.count {
      nums[index] = 0
      index += 1
    }
  }
}
