/// Question Link: https://leetcode.com/problems/max-consecutive-ones/
/// Primary idea: Iterate the whole array and summarize consecutive ones locally and update globally encountering 0
/// Time Complexity: O(n), Space Complexity: O(1)
///

public struct MaxConsecutiveOnes {
  public func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var globalCount = 0
    var localCount = 0
    for num in nums {
      if num == 1 {
        localCount += 1
        globalCount = max(globalCount, localCount)
      } else {
        localCount = 0
      }
    }
    return globalCount
  }
}
