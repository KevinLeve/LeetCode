class Solution {
  String smallestPalindrome(String s) {
    List<int> cnt = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      cnt[s.codeUnitAt(i) - 97]++;
    }

    StringBuffer left = StringBuffer();
    String mid = "";

    for (int i = 0; i < 26; i++) {
      left.write(String.fromCharCode(97 + i) * (cnt[i] ~/ 2));

      if (cnt[i].isOdd) {
        mid = String.fromCharCode(97 + i);
      }
    }

    String l = left.toString();

    return l + mid + l.split('').reversed.join();
  }
}