void main() {
  var values = List<int>.generate(100, (index) => index);
  //var values = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 35, 36];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().bulbSwitch(v);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Solution {
  int bulbSwitch(int n) {
    if (n == 0) {
      return 0;
    }
    if (n == 1 || n == 2 || n == 3) {
      return 1;
    }
    var target = 4;
    int step = 2;
    while (target <= n) {
      step += 2;
      target += step + 1;
    }
    return step ~/ 2;
    // Long way
    /*
    var count = 1;
    for (var i = 3; i <= n; i++) {
      var dividerCount = 1;
      var target = i;
      while (target > 2) {
        target--;
        if (i % target == 0) {
          dividerCount++;
        }
      }
      if (dividerCount.isEven) {
        count++;
      }
    }
    return count;
    */
  }
}
