import 'dart:math';

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode arrToLinkNode(List<int> arr) {
  ListNode? result;
  ListNode? cur;
  for (var v in arr) {
    if (cur == null) {
      cur = ListNode();
      result = cur;
    } else {
      cur.next = ListNode();
      cur = cur.next;
    }
    cur!.val = v;
  }
  return result!;
}

int linkNodeToInt(ListNode? startNode) {
  int value = 0;
  while (startNode != null) {
    value *= 10;
    value += startNode.val;
    startNode = startNode.next;
  }
  return value;
}

void main() {
  final values = [
    [
      [2, 4, 3],
      [5, 6, 4]
    ],
    [
      [0],
      [0]
    ],
    [
      [2, 4, 9],
      [5, 6, 4, 9]
    ],
    [
      [9, 9, 9, 9, 9, 9, 9],
      [9, 9, 9, 9]
    ],
    [
      [1, 2],
      [0]
    ]
  ];
  final expect = [708, 0, 70401, 89990001, 12];
  int index = 0;
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final sw = Stopwatch()..start();
    final result = linkNodeToInt(Solution().addTwoNumbers(arrToLinkNode(v[0]), arrToLinkNode(v[1])));
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

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    var c1 = l1;
    var c2 = l2;
    var p1 = c1;
    var p2 = c2;
    int acc = 0;
    while (c1 != null || c2 != null || acc != 0) {
      int v1 = 0;
      if (c1 != null) {
        v1 = c1.val;
      } else {
        c1 = p1!.next = ListNode(0);
      }
      int v2 = 0;
      if (c2 != null) {
        v2 = c2.val;
      } else {
        c2 = p2!.next = ListNode(0);
      }

      acc += v1 + v2;
      var v = acc;
      if (acc > 9) {
        v = acc % 10;
        acc = acc ~/ 10;
      } else {
        acc = 0;
      }
      c1.val = v;
      p1 = c1;
      p2 = c2;
      c1 = c1.next;
      c2 = c2.next;
    }
    return l1;
  }
}
