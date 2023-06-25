import 'dart:math';

void main() {
  final values = [121, 22, 333, 421, -121, 1, 10, -20, maxInt];
  final expect = [121, 22, 333, 124, -121, 1, 1, -2, 0];
  int index = 0;
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final sw = Stopwatch()..start();
    final result = Solution().reverse(v);
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

final maxInt = pow(2, 31).toInt() - 1;
final minInt = -pow(2, 31).toInt();

class Solution {
  int reverse(int x) {
    final isNegative = x < 0;
    x = x.abs();
    int result = 0;
    while (x > 0) {
      result *= 10;
      final dig = x % 10;
      x = x ~/ 10;
      result += dig;
    }

    result = isNegative ? -result : result;
    if (result < minInt || result > maxInt) {
      return 0;
    } else {
      return result;
    }
  }
}
