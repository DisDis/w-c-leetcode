void main() {
  var values = <List<int>>[
    [1, 2, 3],
    [4, 3, 2, 1],
    [9],
    [1, 9],
    [1, 0],
    [9, 9, 9],
    [9, 9]
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().plusOne(v);
    sb.write(" -> '$result':$v");
    print(sb.toString());
  });
}

class Solution {
  List<int> plusOne(List<int> digits) {
    var lastDigIndex = digits.length - 1;
    var accumulator = 1;
    while (lastDigIndex >= 0) {
      var curDig = digits[lastDigIndex];
      curDig += accumulator;
      if (curDig == 10) {
        digits[lastDigIndex] = 0;
        accumulator = 1;
      } else {
        accumulator = 0;
        digits[lastDigIndex] = curDig;
        break;
      }
      lastDigIndex--;
    }
    if (accumulator == 1) {
      digits.insert(0, 1);
    }
    return digits;
  }
}
