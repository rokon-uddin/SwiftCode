/// Question Link: https://leetcode.com/problems/sort-array-by-parity/
/// Primary idea: traverse the array and insert Even into the 0 th index and odd into the last index
///
/// Time Complexity: O(n), Space Complexity: O(n)
///

public struct SortArrayByParity {
  public func sortArrayByParity(_ nums: [Int]) -> [Int] {
    return nums.enumerated().reduce(into: [Int]()) { (acc, arg) in
      let (_, value) = arg
      acc.insert(value, at: value.isMultiple(of: 2) ? 0 : acc.count)
    }
  }
}
