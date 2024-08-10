/// Question Link: https://leetcode.com/problems/majority-element/
/// Primary idea: traverse the array and track the majority element accordingly
/// 
/// Time Complexity: O(n), Space Complexity: O(1)
///

public struct MajorityElement {
  public func majorityElement(_ nums: [Int]) -> Int {
    var counts = [Int: Int]()
    nums.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }
    let (majority, _) = counts.max { $0.value < $1.value } ?? (0, 0)
    return majority
  }
}
