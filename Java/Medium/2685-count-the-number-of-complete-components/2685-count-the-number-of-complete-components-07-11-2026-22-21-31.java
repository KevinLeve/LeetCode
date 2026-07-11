class Solution {
    private static class DS {
        private int[] mParents;
        private int[] mNodeTotals;
        private int[] mEdgeTotals;

        public DS(int nodeTot) {
            mParents = new int[nodeTot];
            mNodeTotals = new int[nodeTot];
            mEdgeTotals = new int[nodeTot];
            for(int i = 0; i < nodeTot; i++) {
                mParents[i] = i;
                mNodeTotals[i] = 1;
            }
        }

        public boolean isComplete(int root) {
            // Complete graph property is verified only at the component's root.
            if(mParents[root] != root) {
                return false;
            }
            int nodeTot = mNodeTotals[root];
            int edgeTot = mEdgeTotals[root];

            // Check if the component has the maximum possible number of edges.
            return edgeTot == nodeTot * (nodeTot - 1) / 2;
        }

        private int find(int node) {
            if(mParents[node] == node) {
                return node;
            }
            // Path compression.
            return mParents[node] = find(mParents[node]);
        }

        public void addEdge(int node1, int node2) {
            int root1 = find(node1);
            int root2 = find(node2);

            // Track an internal edge within an existing component.
            if(root1 == root2) {
                mEdgeTotals[root2] += 1;
            } else {
                // Merge components and aggregate their node and edge totals.
                mParents[root1] = root2;
                mNodeTotals[root2] += mNodeTotals[root1];
                mEdgeTotals[root2] += mEdgeTotals[root1] + 1;
            }
        }
    }

    public int countCompleteComponents(int nodeTot, int[][] edges) {
        DS ds = new DS(nodeTot);
        for(int[] edge : edges) {
            ds.addEdge(edge[0], edge[1]);
        }

        int count = 0;
        // Count all valid roots representing complete components.
        for(int i = 0; i < nodeTot; i++) {
            if(ds.isComplete(i)) {
                count++;
            }
        }
        return count;
    }
}