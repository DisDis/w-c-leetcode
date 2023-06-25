void main() {
  var values = <List<List<int>>>[
    [
      [3, 2, 2, 3],
      [3]
    ],
    [
      [0, 1, 2, 2, 3, 0, 4, 2],
      [2]
    ]
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().removeElement(v[0], v[1][0]);
    sb.write(" -> '$result' : ${v[0]}");
    print(sb.toString());
  });
}

class Solution {
  int removeElement(List<int> nums, int val) {
    int count = 0;
    final len = nums.length;
    for (var i = 0; i < len; i++) {
      final v = nums[i];
      if (v != val) {
        nums[count] = v;
        count++;
      }
    }
    // nums.length = count;
    return count;
    // nums.removeWhere((element) => element == val);
    // return nums.length;
  }
}
