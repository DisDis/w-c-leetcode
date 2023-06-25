void main() {
  final values = [121, 22, 333, 421, -121, 1, 10];
  final expect = [true, true, true, false, false, true, false];
  int index = 0;
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final sw = Stopwatch()..start();
    final result = Solution().isPalindrome(v);
    sw.stop();
    final exp = expect[index];
    index++;

    final answer = exp == null
        ? '?'
        : result == exp
            ? 'Y'
            : 'n';
    sb.write(" -> time:${sw.elapsedMilliseconds}ms '$answer':'$result'");
    print(sb.toString());
  });
}

class Solution {
  bool isPalindrome(int x) {
    final str = x.toString();
    var lastIndex = str.length - 1;
    var index = 0;
    while (lastIndex > index) {
      if (str[index] != str[lastIndex]) {
        return false;
      }
      lastIndex--;
      index++;
    }
    return true;
  }
}
