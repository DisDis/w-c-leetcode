void main() {
  var values = <List<String>>[
    ["a", "a", "b", "b", "c", "c", "c"],
    ["a", "a", "a", "b", "b", "a", "a"]
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().compress(v);
    sb.write(" -> '$result':$v");
    print(sb.toString());
  });
}

class Solution {
  var compressCount = 0;
  var newSize = 0;
  String? compressChar = null;
  int compress(List<String> chars) {
    if (chars.isEmpty) {
      return 0;
    }
    for (String value in chars) {
      if (compressChar == null) {
        compressCount = 0;
        compressChar = value;
      } else if (compressChar == value) {
        compressCount++;
      } else {
        _flushData(chars);
        compressChar = value;
      }
    }
    _flushData(chars);
    chars.length = newSize;
    return newSize;
  }

  void _flushData(List<String> chars) {
    chars[newSize] = compressChar!;
    newSize++;

    if (compressCount != 0) {
      final countStr = (compressCount + 1).toString();
      for (var i = 0; i < countStr.length; i++) {
        chars[newSize] = countStr[i];
        newSize++;
      }
    }
    compressCount = 0;
  }
}
