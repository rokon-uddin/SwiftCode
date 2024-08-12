/// Question Link: https://leetcode.com/problems/two-sum/
/// Primary idea: Traverse the array and store target - nums[i] in a dict
///
/// Time Complexity: O(n), Space Complexity: O(n)

public struct TwoSum {
  public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dictionary = [Int: Int]()
    for (index, number) in nums.enumerated() {
      if let lastIndex = dictionary[target - number] {
        return [lastIndex, index]
      }
      dictionary[number] = index
    }
    fatalError("No valid outputs")
  }
}
