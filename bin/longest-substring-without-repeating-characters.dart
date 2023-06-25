void main() {
  var values = <String>["au", "abcabcbb", "bbbbb", "pwwkew"];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().lengthOfLongestSubstring(v);
    sb.write(" -> '$result':$v");
    print(sb.toString());
  });
}

class Solution {
  int lengthOfLongestSubstring(String s) {
    if (s.isEmpty) {
      return 0;
    }
    int startIndex = 0;
    int index = 1;
    String subStr = s[0];
    String maxSubStr = subStr;
    var count = s.length;
    while (index < count) {
      final indexOf = subStr.indexOf(s[index]);
      if (indexOf != -1) {
        if (indexOf == 0) {
          startIndex++;
        } else {
          startIndex += indexOf + 1;
        }
      }
      subStr = s.substring(startIndex, index + 1);
      if (maxSubStr.length < subStr.length) {
        maxSubStr = subStr;
      }
      index++;
    }
    print(maxSubStr);
    return maxSubStr.length;
  }
}
