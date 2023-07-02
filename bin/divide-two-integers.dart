import 'dart:math';

void main() {
  final values = [
    [10, 3],
    [7, -3],
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1],
    [2, 2],
    [-2147483648, 3],
    [-2147483648, 1],
  ];
  final expect = [3, -2, 1, -1, -1, 1, 1, -715827882, -2147483648];
  int index = 0;
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final sw = Stopwatch()..start();
    final result = Solution().divide(v[0], v[1]);
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
  int divide(int dividend, int divisor) {
    int result = 0;

    bool isNegative = (divisor < 0 && dividend > 0) || (divisor > 0 && dividend < 0);
    if (divisor < 0) {
      divisor = -divisor;
    }
    if (dividend < 0) {
      dividend = -dividend;
    }
    if (dividend < divisor) {
      return 0;
    }

    if (divisor != 1 && divisor != -1) {
      int n = 0;
      while (dividend > (divisor << n)) {
        n++;
      }

      if (n != 0) {
        int upD = dividend - (divisor << (n - 1));
        int downD = (divisor << n) - dividend;
        if (upD < downD) {
          dividend -= divisor << (n - 1);
          result = 1 << (n - 1);
        } else {
          int tmp = divisor << n;
          result = 1 << n;
          while (tmp > dividend) {
            tmp -= divisor;
            result--;
          }
          dividend -= tmp;
        }
      }
      while (dividend > 0) {
        dividend -= divisor;
        if (dividend >= 0) {
          result++;
        }
      }
    } else {
      result = dividend;
      if (result < 0) {
        result = -result;
      }
    }

    result = isNegative ? -result : result;
    if (result < minInt) {
      return minInt;
    } else if (result > maxInt) {
      return maxInt;
    }
    return result;
  }
}
