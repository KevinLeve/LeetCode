class Solution {
public:
    string key(int x, int y) {
        return to_string(x) + "#" + to_string(y);
    }

    int maxRectangleArea(vector<vector<int>>& pt) {
        unordered_set<string> st;
        int n = pt.size();
        int area = -1;

        for (auto &p : pt) {
            st.insert(key(p[0], p[1]));
        }

        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {

                int x1 = pt[i][0], y1 = pt[i][1];
                int x2 = pt[j][0], y2 = pt[j][1];

                if (x1 == x2 || y1 == y2) continue;

                if (st.find(key(x1, y2)) != st.end() &&
                    st.find(key(x2, y1)) != st.end()) {

                    bool found = true;

                    for (auto &p : pt) {
                        int x = p[0], y = p[1];

                        if ((x == x1 && y == y1) ||
                            (x == x2 && y == y2) ||
                            (x == x1 && y == y2) ||
                            (x == x2 && y == y1)) {
                            continue;
                        }

                        if (x >= min(x1, x2) && x <= max(x1, x2) &&
                            y >= min(y1, y2) && y <= max(y1, y2)) {
                            found = false;
                            break;
                        }
                    }

                    if (found) {
                        area = max(area, abs(x1 - x2) * abs(y1 - y2));
                    }
                }
            }
        }

        return area;
    }
};