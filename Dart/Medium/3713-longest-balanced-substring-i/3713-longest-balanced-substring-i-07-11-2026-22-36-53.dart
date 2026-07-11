class Solution {
  int longestBalanced(String s) {
    int n = s.length;
    int maxLen = 0;

    for (int i = 0; i < n; i++) {
      List<int> freq = List.filled(26, 0);
      for (int j = i; j < n; j++) {
        int idx = s.codeUnitAt(j) - 'a'.codeUnitAt(0);
        freq[idx]++;

        if (_isBalanced(freq)) {
          maxLen = maxLen < (j - i + 1) ? (j - i + 1) : maxLen;
        }
      }
    }
    return maxLen;
  }

  bool _isBalanced(List<int> freq) {
    int common = 0;
    for (int f in freq) {
      if (f > 0) {
        if (common == 0) {
          common = f;
        } else if (f != common) {
          return false;
        }
      }
    }
    return true;
  }
}