void main() {
  var values = ["ab_a", ".,", "A man, a plan, a canal: Panama", "race a car", ' ', ".,"];
  values.forEach((v) {
    final result = Solution().isPalindrome(v);
    print("'$v'->$result");
  });
}

class Solution {
  int startIndex = 0;
  int endIndex = 0;
  var _leftChar = ' ';
  var _rightChar = ' ';
  static final _expAlphaNum = RegExp(r"\w");
  bool isPalindrome(String s) {
    startIndex = 0;
    endIndex = s.length - 1;
    if (startIndex == endIndex && endIndex == 0) {
      return true;
    }
    while (endIndex > startIndex) {
      _skipLeft(s);
      _skipRight(s);
      if (_leftChar != _rightChar) {
        return false;
      }
    }
    return true;
  }

  void _skipLeft(String s) {
    while (startIndex < s.length) {
      final c = s[startIndex].toLowerCase();
      startIndex += 1;
      if (_isAlphaNum(c)) {
        _leftChar = c;
        return;
      }
    }
    _leftChar = ' ';
  }

  void _skipRight(String s) {
    while (endIndex >= 0) {
      final c = s[endIndex].toLowerCase();
      endIndex -= 1;
      if (_isAlphaNum(c)) {
        _rightChar = c;
        return;
      }
    }
    _rightChar = ' ';
  }

  bool _isAlphaNum(final String c) {
    return c != '_' && _expAlphaNum.hasMatch(c);
  }
}
