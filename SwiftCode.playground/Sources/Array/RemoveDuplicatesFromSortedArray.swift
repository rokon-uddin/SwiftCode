/// Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
/// Primary idea: keep a index, compare the element at that index with the element moving forward
/// Time Complexity: O(n), Space Complexity: O(1)
///

public struct RemoveDuplicatesFromSortedArray {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    let set = Set(nums)
    nums = Array(set).sorted { $0 < $1 }
    return nums.count
  }
}
