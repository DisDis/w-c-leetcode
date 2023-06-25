void main() {
  var values = <List<List<int>>>[
    [
      [2, 7, 11, 15],
      [9]
    ],
    [
      [3, 2, 4],
      [6]
    ],
    [
      [3, 3],
      [6]
    ],
    [
      List<int>.generate(10001, (index) => index),
      [19999]
    ]
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().twoSum(v[0], v[1][0]);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final indexByNum = <int, List<int>>{};
    final len = nums.length;
    for (var i = 0; i < len; i++) {
      indexByNum.update(nums[i], (indexs) => indexs..add(i), ifAbsent: () => [i]);
    }
    for (var i = 0; i < len; i++) {
      final one = nums[i];
      final two = target - one;
      final targetIndexes = indexByNum[two];
      if (targetIndexes != null) {
        final targetIndex = targetIndexes.firstWhere(
          (element) => element != i,
          orElse: () => -1,
        );
        if (targetIndex != -1) {
          return [i, targetIndex];
        }
      }
    }
    return [];
  }
}
