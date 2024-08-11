// Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
// Primary idea: keep a index, compare between the element at that index, the element at index - 1, and the element moving forward
// Time Complexity: O(n), Space Complexity: O(1)
//

public struct IntersectionTwoArraysTwo {
  public func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var numberFrequency = Dictionary(nums1.map { ($0, 1) }, uniquingKeysWith: +)
    var result = [Int]()
    for number in nums2 {
      if let frequency = numberFrequency[number], frequency > 0 {
        result.append(number)
        numberFrequency[number] = frequency - 1
      }
    }
    return result
  }
}
