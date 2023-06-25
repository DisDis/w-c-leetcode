import 'dart:math';

void main() {
  var values = <List<List<int>>>[
    [
      [1, 3],
      [2, 6],
      [8, 10],
      [15, 18]
    ],
    [
      [1, 4],
      [4, 5]
    ]
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().merge(v);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Solution {
  bool tryToMerge(List<int> target, List<int> test) {
    if (target[0] <= test[0] && test[0] <= target[1]) {
      target[0] = min(target[0], test[0]);
      target[1] = max(target[1], test[1]);
      return true;
    }
    return false;
  }

  List<List<int>> merge(List<List<int>> intervals) {
    List<List<int>> result = [];
    intervals.sort((a, b) {
      return a[0].compareTo(b[0]);
    });
    result.add(intervals.first);

    for (var interval in intervals) {
      var last = result.last;
      if (!tryToMerge(last, interval)) {
        result.add(interval);
      }
    }
    return result;
  }
}
