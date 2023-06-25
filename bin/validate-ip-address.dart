void main() {
  var values = <String>[
    "172.16.254.1",
    "192.168.1.1",
    "192.168.1.0",
    "192.168.01.1",
    "192.168.1.00",
    "192.168@1.1",
    "2001:0db8:85a3:0:0:8A2E:0370:7334",
    "256.256.256.256",
    "2001:0db8:85a3:0000:0000:8a2e:0370:7334",
    "2001:db8:85a3:0:0:8A2E:0370:7334",
    "2001:0db8:85a3::8A2E:037j:7334",
    "02001:0db8:85a3:0000:0000:8a2e:0370:7334"
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().validIPAddress(v);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Solution {
  static final parseIPv4 = RegExp(r"^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$");
  static final parseIPv6 = RegExp(
      r"^([\dABCDEF]{1,4})\:([\dABCDEF]{1,4})\:([\dABCDEF]{1,4})\:([\dABCDEF]{1,4})\:([\dABCDEF]{1,4})\:([\dABCDEF]{1,4})\:([\dABCDEF]{1,4})\:([\dABCDEF]{1,4})$");
  static const resultNeither = "Neither";
  static const resultIPv4 = "IPv4";
  static const resultIPv6 = "IPv6";
  String validIPAddress(String queryIP) {
    queryIP = queryIP.toUpperCase();
    if (queryIP.contains('.')) {
      // IPv4
      final ipv4match = parseIPv4.firstMatch(queryIP);
      if (ipv4match == null) {
        return resultNeither;
      }

      if (ipv4match.groupCount < 4) {
        return resultNeither;
      }

      if (ipv4match[1]!.startsWith('0') == 0) {
        return resultNeither;
      }

      for (var i = 1; i < 5; i++) {
        final group = ipv4match.group(i)!;
        if (group.length > 1 && group.startsWith('0')) {
          return resultNeither;
        }
        final byteValue = int.tryParse(group);
        if (byteValue == null || byteValue > 255) {
          return resultNeither;
        }
      }
      return resultIPv4;
    } else if (queryIP.contains(':')) {
      // IPv6
      final ipv6match = parseIPv6.firstMatch(queryIP);
      if (ipv6match == null) {
        return resultNeither;
      }

      if (ipv6match.groupCount < 8) {
        return resultNeither;
      }

      if (ipv6match[1]!.startsWith('0') == 0) {
        return resultNeither;
      }
      // for (var i = 1; i < 9; i++) {
      //   final group = ipv6match.group(i)!;
      //   final wordValue = int.tryParse(group, radix: 16);
      //   if (wordValue == null || wordValue > 65535) {
      //     return resultNeither;
      //   }
      // }
      return resultIPv6;
    } else {
      return resultNeither;
    }
  }
}
