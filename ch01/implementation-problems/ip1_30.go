package main

import (
	"iter"
	"math"
	"slices"
)

type Point struct{ x, y float64 }

func Distance(p1, p2 Point) float64 {
	diffX := p2.x - p1.x
	diffY := p2.y - p1.y
	return math.Sqrt(diffX*diffX + diffY*diffY)
}

// NearestNeighbor returns sorted points from source.
// The order of the returned slice indicates the solution to the NearestNeighbor
// heuristic for the given problem.
func NearestNeighbor(source []Point) []Point {
	if len(source) == 0 {
		return nil
	}

	visited := make(map[int]struct{}) // Set of visited indexes.
	tour := make([]Point, len(source))

	// p = p_0
	tour[0] = source[0]
	visited[0] = struct{}{}

	i := 0
	for len(visited) < len(source) {
		i++
		// Select p_i to be the closest unvisited point to p_(i-1)
		minDist := math.Inf(1) // Start at positive infinity.
		bestJ := -1
		for j := range len(source) {
			_, skip := visited[j]
			if skip {
				continue
			}
			dist := Distance(tour[i], source[j])
			if dist < minDist {
				bestJ = j
				minDist = dist
			}
		}
		// Visit p_i
		tour[i] = source[bestJ]
		visited[bestJ] = struct{}{}
	}
	// Return to p_0 from p_(n_1) is implicit.
	// The caller should know whether this tour is closed.
	return tour
}

func ClosestPair(source []Point) []Point {
	n := len(source)
	// A chain is an ordered list of points.
	// Each vertex begins as its own single vertex chain.
	chains := make([][]Point, n)
	for i, pt := range source {
		chains[i] = []Point{pt}
	}

	for i := 1; i < n; i++ {
		bestDist := math.Inf(1)

		var (
			bestIdxS, bestIdxT int // Chain indexes.
			bestEndS, bestEndT int // Chain endpoint indexes [0,1].
		)
		// For each pair of endpoints from distinct vertex chains.
		for chainIdxS := range len(chains) {
			for chainIdxT := chainIdxS + 1; chainIdxT < len(chains); chainIdxT++ {
				// Compare the 2, 3 or 4 endpoints.
				for chainEndS, s := range endpointsIter(chains[chainIdxS]) {
					for chainEndT, t := range endpointsIter(chains[chainIdxT]) {
						if d := Distance(s, t); d < bestDist {
							bestDist = d
							bestIdxS = chainIdxS
							bestEndS = chainEndS
							bestIdxT = chainIdxT
							bestEndT = chainEndT
						}
					}
				}
			}
		}

		// Merge chains by selected endpoints.
		sChain := chains[bestIdxS]
		tChain := chains[bestIdxT]
		// For simplicity, take chain `s` to always have
		// to be the first segment of the resulting chain.
		// Which means, we want to hold the endpoints that
		// go 'along the grain' for both chains.
		if bestEndS == 0 {
			slices.Reverse(sChain)
		}
		if bestEndT == 1 {
			slices.Reverse(tChain)
		}

		// Save new, merged chain.
		chains[bestIdxS] = append(sChain, tChain...)

		// Remove merged chain.
		chains = append(chains[:bestIdxT], chains[bestIdxT+1:]...)
	}

	// We should be left with a single chain.
	if len(chains) != 1 {
		panic("something failed")
	}

	return chains[0]
}

func endpointsIter[T any](s []T) iter.Seq2[int, T] {
	return func(yield func(int, T) bool) {
		if !yield(0, s[0]) {
			return
		}
		yield(1, s[len(s)-1])
	}
}
