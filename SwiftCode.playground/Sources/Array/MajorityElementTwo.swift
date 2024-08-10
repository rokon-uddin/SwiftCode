/// Question Link: https://leetcode.com/problems/majority-element-ii/
/// Primary idea: traverse the array and track the majority element accordingly, do not forget to verify they are valid after first iteration
/// 
/// Time Complexity: O(n), Space Complexity: O(1)
///

public struct MajorityElementTwo {
  public func majorityElement(_ nums: [Int]) -> [Int] {
    var counts = [Int: Int]()
    nums.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }
    let filterCounts = counts.filter { $0.value > (nums.count / 3) }

    let majorityElements = filterCounts.reduce(into: [Int]()) { (acc, arg) in
      let (index, _) = arg
      acc.insert(index, at: 0)
    }
    return majorityElements
  }
}
