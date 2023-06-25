void main() {
  var values = <String>["  0000000000012345678", "0100", "42", "-42", "   42  fdsfsf", "  -42   -22edsd", "4193 with words", "-9147483648", "9147483648"];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().myAtoi(v);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Solution {
  static final parseDigs = RegExp(r"^[+-]{0,1}\d+");
  static final skipZero = RegExp(r'^0+');
  static const minValue = -2147483648;
  static const maxValue = 2147483648 - 1;
  static final zeroCode = "0".codeUnits[0];
  int myAtoi(String s) {
    var strNum = parseDigs.stringMatch(s.trimLeft());
    if (strNum == null) {
      return 0;
    }
    final char = strNum[0];
    final isNegative = char == '-';
    if (char == '-' || char == '+') {
      strNum = strNum.substring(1);
    }
    if (strNum[0] == '0') {
      strNum = strNum.replaceFirst(skipZero, '');
    }
    final digs = <int>[];
    for (var i = 0; i < strNum.length; i++) {
      final char = strNum[i];
      digs.add(char.codeUnits[0] - zeroCode);

      if (digs.length > 10) {
        // too big number
        break;
      }
    }
    var index = digs.length - 1;
    var coefficient = 1;
    int result = 0;

    while (index >= 0) {
      result += digs[index] * coefficient;
      coefficient *= 10;
      index--;
    }
    if (isNegative) {
      result *= -1;
    }
    if (result > maxValue) {
      return maxValue;
    } else if (result < minValue) {
      return minValue;
    }
    return result;
  }
}
