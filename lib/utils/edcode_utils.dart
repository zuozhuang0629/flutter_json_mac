import 'dart:convert';

class DecodeUtils {
  String decode(String data) {
    var datanew = data.replaceRange(1, 2, "");

    List<int> bytes2 = base64Decode(datanew);
    String decodeStr = String.fromCharCodes(bytes2);

    return decodeStr;
  }
}
