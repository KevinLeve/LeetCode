class Solution {
  List<int> arrayRankTransform(List<int> arr) {
    List<int> rank = [];
    List<int> duplicate = List<int>.from(arr).toSet().toList();
    duplicate.sort();
    Map<dynamic, dynamic> rankMap = {for (int i in duplicate) i : duplicate.indexOf(i) + 1};
    for(int i = 0; i < arr.length; i++) {
        rank.add(rankMap[arr[i]]);
    }
    return rank;
  }
}