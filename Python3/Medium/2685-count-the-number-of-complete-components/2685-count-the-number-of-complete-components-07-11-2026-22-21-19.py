class DS:
    def __init__(self, node_tot: int):
        self.mParents = list(range(node_tot))
        self.mNodeTotals = [1] * node_tot
        self.mEdgeTotals = [0] * node_tot

    def is_complete(self, root: int) -> bool:
        # Complete graph property is verified only at the component's root.
        if self.mParents[root] != root:
            return False
        
        node_tot = self.mNodeTotals[root]
        edge_tot = self.mEdgeTotals[root]

        # Check if the component has the maximum possible number of edges.
        return edge_tot == node_tot * (node_tot - 1) // 2

    def find(self, node: int) -> int:
        if self.mParents[node] == node:
            return node
        # Path compression.
        self.mParents[node] = self.find(self.mParents[node])
        return self.mParents[node]

    def add_edge(self, node1: int, node2: int) -> None:
        root1 = self.find(node1)
        root2 = self.find(node2)

        # Track an internal edge within an existing component.
        if root1 == root2:
            self.mEdgeTotals[root2] += 1
        else:
            # Merge components and aggregate their node and edge totals.
            self.mParents[root1] = root2
            self.mNodeTotals[root2] += self.mNodeTotals[root1]
            self.mEdgeTotals[root2] += self.mEdgeTotals[root1] + 1


class Solution:
    def countCompleteComponents(self, nodeTot: int, edges: list[list[int]]) -> int:
        ds = DS(nodeTot)
        for edge in edges:
            ds.add_edge(edge[0], edge[1])
        
        # Count all valid roots representing complete components.
        return sum(1 for i in range(nodeTot) if ds.is_complete(i))