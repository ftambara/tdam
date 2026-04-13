== Exercise 1-7

#problem[
  The _maximum clique_ problem in a graph $G = (V, E)$ asks for the largest 
  subset $C$ of vertices $V$ such that there is an edge in $E$ between every 
  pair of vertices in $C$. 

  Find a counterexample for the following algorithm: 
  1. Sort the vertices of $G$ from highest to lowest degree. 
  2. Considering the vertices in order of degree, for each vertex, add it to 
     the clique if it is a neighbor of all vertices currently in the clique. 
  3. Repeat until all vertices have been considered.
]

If we consider the fact that this algorithm will always pick the highest-degree vertex,
we can construct a graph in which such a vertex is not part of the maximum clique.

#import fletcher.shapes: circle

#diagram(
  node-shape: circle,
  node-stroke: black,
  // edge-stroke: black + 1pt,

  node((0, 0), $a$, name: <left>),          // Far left node
  node((1, 0), $b$, name: <hub>),           // Center of the cross
  node((1, 1), $c$, name: <top>),           // Top of the cross
  node((1, -1), $d$, name: <bottom>),       // Bottom of the cross
  node((2, 0), $e$, name: <mid>),           // Node between cross and triangle
  node((3, 1), $f$, name: <tri_top>),     // Top node of the triangle
  node((3, -1), $g$, name: <tri_bottom>), // Bottom node of the triangle

  // --- Edges ---
  // Cross structure
  edge(<left>, <hub>),
  edge(<hub>, <top>),
  edge(<hub>, <bottom>),
  edge(<hub>, <mid>),
  
  // Triangle structure
  edge(<mid>, <tri_top>, stroke: red),
  edge(<mid>, <tri_bottom>, stroke: red),
  edge(<tri_top>, <tri_bottom>, stroke: red),
)

The algorithm will pick $b$ first, which is not part of the solution,
making it impossible to arrive to $C = {e, g, f}$.
