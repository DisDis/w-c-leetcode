void main() {
  var values = <List<List<int>>>[
    [
      [4, 5, 8],
      [10, 9, 1, 8],
      [2]
    ],
    [
      [1, 4, 2, 3],
      [-4, -3, 6, 10, 20, 30],
      [3]
    ],
    [
      [2, 1, 100, 3],
      [-5, -2, 10, -3, 7],
      [6]
    ]
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().findTheDistanceValue(v[0], v[1], v[2][0]);
    sb.write(" -> '$result':$v");
    print(sb.toString());
  });
}

class Solution {
  int findTheDistanceValue(List<int> arr1, List<int> arr2, int d) {
    var count = 0;
    for (var av1 in arr1) {
      var isFound = false;
      for (var av2 in arr2) {
        if ((av1 - av2).abs() <= d) {
          isFound = true;
          break;
        }
      }
      if (!isFound) {
        count++;
      }
    }
    return count;
  }
}
