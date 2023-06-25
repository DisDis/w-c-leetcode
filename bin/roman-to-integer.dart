void main() {
  var values = <String>["III", "LVIII", "MCMXCIV", "MCMXCIII"];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().romanToInt(v);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Solution {
  int converSymToInt(String c) {
    switch (c) {
      case "I":
        return 1;
      case "V":
        return 5;
      case "X":
        return 10;
      case "L":
        return 50;
      case "C":
        return 100;
      case "D":
        return 500;
      case "M":
        return 1000;
    }
    // ???
    return 0;
  }

  int romanToInt(String s) {
    int result = 0;
    int prev = 0;
    final len = s.length;
    for (var i = 0; i < len; i++) {
      var current = converSymToInt(s[i]);
      if (prev < current) {
        result -= prev * 2;
      }
      result += current;
      prev = current;
    }
    return result;
  }
}
