void main() {
  var values = <List<int>>[
    [1, 1, 2],
    [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().removeDuplicates(v);
    sb.write(" -> '$result':$v");
    print(sb.toString());
  });
}

class Solution {
  int removeDuplicates(List<int> nums) {
    int startIndex = 0;
    int minimalValue = nums[0];
    if (nums.length == 1) {
      return 1;
    }
    for (var i = 1; i < nums.length; i++) {
      final currentValue = nums[i];
      if (minimalValue < currentValue) {
        startIndex++;
        nums[startIndex] = currentValue;
        minimalValue = currentValue;
      }
    }
    return startIndex + 1;
  }
}
