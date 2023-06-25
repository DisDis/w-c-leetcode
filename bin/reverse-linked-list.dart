void main() {
  var values = <ListNode>[
    _generateListNode([1, 2, 3, 4, 5])
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().reverseList(v);
    sb.write("->'$result'");
    print(sb.toString());
  });
}

ListNode _generateListNode(List<int> input) {
  final result = ListNode();
  var prev = result;
  var current = result;
  input.forEach((element) {
    current.val = element;
    prev = current;
    current = ListNode();
    prev.next = current;
  });
  prev.next = null;
  return result;
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
  @override
  String toString() {
    final sb = StringBuffer("[");
    ListNode? cur = this;
    while (cur != null) {
      sb.write('${cur.val},');
      cur = cur.next;
    }
    sb.write(']');
    return sb.toString();
  }
}

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? reverseList(ListNode? head) {
    if (head == null) {
      return null;
    }
    if (head.next == null) {
      return head;
    }
    ListNode? current = head;
    ListNode? prev = null;
    while (current != null) {
      final tmp = current.next;
      current.next = prev;
      prev = current;
      current = tmp;
    }
    return prev;
  }
}
