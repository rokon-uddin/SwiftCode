/// Question Link: https://leetcode.com/problems/contains-duplicate-ii/
/// Primary idea: use a dictionary to check duplicates, then judge if their distance is less than k
///
/// Time Complexity: O(n), Space Complexity: O(n)
///

public struct ContainsDuplicateTwo {
  public func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    guard nums.count > 1 else { return false }
    var dictionary = [Int: Int]()
    for (index, number) in nums.enumerated() {
      if let lastIndex = dictionary[number], index - lastIndex <= k {
        return true
      } else {
        dictionary[number] = index
      }
    }
    return false
  }
}
