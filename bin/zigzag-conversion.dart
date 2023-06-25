void main() {
  var values = <List<String>>[
    ["PAYPALISHIRING", "4"],
    ["PAYPALISHIRING", "3"],
    ["PAYPALISHIRING", "4"],
    ["A", "1"]
  ];

  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().convert(v[0], int.parse(v[1]));
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Solution {
  String convert(String s, int numRows) {
    if (numRows == 1) {
      return s;
    }
    final len = s.length;
    final result = <String>[];
    final fullStep = 2 * numRows - 2;
    for (var r = 1; r <= numRows; r++) {
      var index = r - 1;
      if (r == 1 || r == numRows) {
        // Special row with 2 elements
        while (index < len) {
          result.add(s[index]);
          index += fullStep;
        }
      } else {
        // row with 3 elements
        final semiStep = 2 * (numRows - (r - 1)) - 2;
        final fullStepSpec = fullStep - semiStep;
        bool isFullStep = false;
        while (index < len) {
          result.add(s[index]);
          index += (isFullStep ? fullStepSpec : semiStep);
          isFullStep = !isFullStep;
        }
      }
    }
    return result.join();
  }
}
