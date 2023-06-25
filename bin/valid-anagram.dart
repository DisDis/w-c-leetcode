void main() {
  var values = <List<String>>[
    ["anagram", "nagaram"],
    ["rat", "car"],
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().isAnagram(v[0], v[1]);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Solution {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) {
      return false;
    }
    final chars = <String, int>{};
    final count = s.length;
    for (var i = 0; i < count; i++) {
      final c = s[i];
      chars.update(
        c,
        (value) => value + 1,
        ifAbsent: () => 1,
      );
    }
    for (var i = 0; i < count; i++) {
      final c = t[i];
      var curValue = chars[c];
      if (curValue == null) {
        return false;
      } else {
        curValue = curValue - 1;
        if (curValue < 0) {
          return false;
        }
        chars[c] = curValue;
      }
    }
    return true;
  }
}
