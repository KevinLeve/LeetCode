class Solution {
  List<int> sequentialDigits(int low, int high) {
    final result = <int>[];
    int limit = high;
    int count = 0;
    while (limit != 0) {
      limit ~/= 10;
      count++;
    }

    for (var i = 2; i <= count; i++) {
      final output = readLength(i);
      for (var j = 0; j < output.length; j++) {
        final value = output[j];
        if (value >= low && value <= high) {
          result.add(value);
        }
      }
    }

    return result;
  }

  List<int> readLength(int length) {
    List<int> result = [];
    final input = '123456789';
    final n = input.length;
    for (var i = 0; i + 1 < n; i++) {
      if (length + i > n) {
        continue;
      }
      result.add(int.parse(input.substring(i, length + i)));
    }

    return result;
  }
}