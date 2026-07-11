/**
 * @param {number} nodeTot
 * @param {number[][]} edges
 * @return {number}
 */
var countCompleteComponents = function(nodeTot, edges) {
    class DS {
        constructor(nodeTot) {
            this.mParents = Array.from({ length: nodeTot }, (_, i) => i);
            this.mNodeTotals = Array(nodeTot).fill(1);
            this.mEdgeTotals = Array(nodeTot).fill(0);
        }

        isComplete(root) {
            // Complete graph property is verified only at the component's root.
            if(this.mParents[root] !== root) {
                return false;
            }
            const nodeTot = this.mNodeTotals[root];
            const edgeTot = this.mEdgeTotals[root];

            // Check if the component has the maximum possible number of edges.
            return edgeTot === nodeTot * (nodeTot - 1) / 2;
        }

        find(node) {
            if(this.mParents[node] === node) {
                return node;
            }
            // Path compression.
            return this.mParents[node] = this.find(this.mParents[node]);
        }

        addEdge(node1, node2) {
            const root1 = this.find(node1);
            const root2 = this.find(node2);

            // Track an internal edge within an existing component.
            if(root1 === root2) {
                this.mEdgeTotals[root2] += 1;
            } else {
                // Merge components and aggregate their node and edge totals.
                this.mParents[root1] = root2;
                this.mNodeTotals[root2] += this.mNodeTotals[root1];
                this.mEdgeTotals[root2] += this.mEdgeTotals[root1] + 1;
            }
        }
    }

    const ds = new DS(nodeTot);
    for(const edge of edges) {
        ds.addEdge(edge[0], edge[1]);
    }

    let count = 0;
    // Count all valid roots representing complete components.
    for(let i = 0; i < nodeTot; i++) {
        if(ds.isComplete(i)) {
            count++;
        }
    }
    return count;
};