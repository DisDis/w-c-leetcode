void main() {
  var values = <List<int>>[
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [0, 1, 2, 4, 2, 1],
    [2, 0, 2],
    [2, 1],
    [3, 5, 5],
    [0, 3, 2, 1],
    [0, 2, 3, 3, 5, 2, 1, 0]
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().validMountainArray(v);
    sb.write(" -> '$result':$v");
    print(sb.toString());
  });
}

class Solution {
  bool validMountainArray(List<int> arr) {
    if (arr.length < 3) {
      return false;
    }
    int prevValue = arr[0];
    if (arr[1] - prevValue <= 0) {
      return false;
    }
    bool walkUp = true;
    for (var i = 1; i < arr.length; i++) {
      var value = arr[i];
      if (walkUp) {
        if (prevValue == value) {
          return false;
        } else if (prevValue > value) {
          walkUp = false;
        }
      } else {
        if (prevValue == value) {
          return false;
        } else if (prevValue < value) {
          return false;
        }
      }
      prevValue = value;
    }
    return true && !walkUp;
  }
}
