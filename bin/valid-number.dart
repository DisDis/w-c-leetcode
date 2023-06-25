void main() {
  var values = <String>[
    "3.",
    "2",
    "0089",
    "-0.1",
    "+3.14",
    "4.",
    "-.9",
    "2e10",
    "-90E3",
    "3e+7",
    "+6e-1",
    "53.5e93",
    "-123.456e789",
    /*NotValid*/ "-------------------",
    "false",
    "abc",
    "1a",
    "1e",
    "e3",
    "99e2.5",
    "--6",
    "-+3",
    "95a54e53",
    ".",
    "..2",
    ".e1",
    ".-4"
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().isNumber(v);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

enum ParseStage { sign, detectInteger, parseInt, detectDec, parseDec }

enum SignStatus { unknown, defined }

enum EStatus { unknown, readyNum, defined }

class Solution {
  static final codeE = "E".codeUnits[0];
  static final codee = "e".codeUnits[0];
  static final codePlus = "+".codeUnits[0];
  static final codeMin = "-".codeUnits[0];
  static final codeDot = ".".codeUnits[0];
  static final code0 = "0".codeUnits[0];
  static final code9 = "9".codeUnits[0];

  bool _isDig(int code) {
    return code >= code0 && code <= code9;
  }

  bool isNumber(String s) {
    var signStatus = SignStatus.unknown;
    var stage = ParseStage.detectInteger;
    var eStatus = EStatus.unknown;
    var hasDig = false;
    for (var code in s.codeUnits) {
      // sign stage
      if (code == codePlus || code == codeMin) {
        if (signStatus != SignStatus.unknown) {
          // Double sign?
          return false;
        }
        if (stage == ParseStage.detectDec && eStatus != EStatus.readyNum) {
          return false;
        }
        signStatus = SignStatus.defined;
      } else if (_isDig(code)) {
        if (hasDig == false && eStatus == EStatus.readyNum) {
          // No dig before E
          return false;
        }
        hasDig = true;
        signStatus = SignStatus.defined;
        if (stage == ParseStage.detectInteger) {
          stage = ParseStage.parseInt;
        } else if (stage == ParseStage.detectDec) {
          stage = ParseStage.parseDec;
        }
        if (eStatus == EStatus.readyNum) {
          eStatus = EStatus.defined;
        }
      } else if (code == codeE || code == codee) {
        signStatus = SignStatus.unknown;
        if (eStatus != EStatus.unknown) {
          // double E?
          return false;
        }
        if (stage == ParseStage.detectInteger) {
          // no dig before E
          return false;
        }
        eStatus = EStatus.readyNum;
      } else if (code == codeDot) {
        if (eStatus != EStatus.unknown) {
          // Dot after E
          return false;
        }
        if (stage == ParseStage.detectInteger || stage == ParseStage.parseInt) {
          stage = ParseStage.detectDec;
        } else {
          // Double dot?
          return false;
        }
      } else {
        // Unknown symbol?
        return false;
      }
    }
    if (eStatus == EStatus.readyNum) {
      // no E digs!
      return false;
    }
    if (stage == ParseStage.detectInteger || (stage == ParseStage.detectDec && hasDig == false)) {
      // No digs!
      return false;
    }
    return true;
  }
}
