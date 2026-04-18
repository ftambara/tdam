package main

import (
	"slices"
	"testing"
)

func TestNearestNeighbor(t *testing.T) {
	source := []Point{
		{0, 0},
		{1, 0},
		{-21, 0},
		{-5, 0},
		{-1, 0},
		{3, 0},
		{11, 0},
	}
	want := []Point{
		{0, 0},
		{1, 0},
		{-1, 0},
		{3, 0},
		{-5, 0},
		{11, 0},
		{-21, 0},
	}

	got := NearestNeighbor(source)

	if !slices.Equal(got, want) {
		t.Errorf("got %v, want %v", got, want)
	}
}

func TestClosestPair(t *testing.T) {
	// We use epsilon = 0.1 for this concrete example
	source := []Point{
		{0.0, 0.0},
		{0.1, 0.9},
		{1.2, 0.9},
		{2.5, 0.9},
		{2.4, 0.0},
		{1.3, 0.0},
	}
	want := []Point{
		{0.0, 0.0},
		{0.1, 0.9},
		{1.2, 0.9},
		{1.3, 0.0},
		{2.4, 0.0},
		{2.5, 0.9},
	}

	got := ClosestPair(source)

	if slices.Equal(got, want) {
		return
	}

	// Paths could be equal but start at opposite endpoints.
	slices.Reverse(got)
	if slices.Equal(got, want) {
		return
	}

	t.Errorf("got %v, want %v", got, want)
}
