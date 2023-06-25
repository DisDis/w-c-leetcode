void main() {
  var values = <List<String>>[
    ["abba", "dog cat cat dog"],
    ["abba", "dog cat cat fish"],
    ["aaaa", "dog cat cat dog"],
    ["abba", "dog dog dog dog"]
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().wordPattern(v[0], v[1]);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Solution {
  bool wordPattern(String pattern, String s) {
    final words = s.split(' ');
    if (pattern.length != words.length) {
      return false;
    }
    final matchCandW = <String, String>{};
    final matchWandC = <String, String>{};
    for (var i = 0; i < pattern.length; i++) {
      final word = words[i];
      final c = pattern[i];
      final expWord = matchCandW[c];
      final expChar = matchWandC[word];
      if (expWord == null && expChar == null) {
        matchCandW[c] = word;
        matchWandC[word] = c;
      } else if (expWord != word || expChar != c) {
        return false;
      }
    }
    return true;
  }
}
