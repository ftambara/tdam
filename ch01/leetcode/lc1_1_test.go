package main

import (
	"reflect"
	"testing"
)

func TestDailyTemperaturesWithStack(t *testing.T) {
	tests := []struct {
		name         string
		temperatures []int
		want         []int
	}{
		{
			name:         "Example 1: Standard variation",
			temperatures: []int{73, 74, 75, 71, 69, 72, 76, 73},
			want:         []int{1, 1, 4, 2, 1, 1, 0, 0},
		},
		{
			name:         "Example 2: Strictly increasing",
			temperatures: []int{30, 40, 50, 60},
			want:         []int{1, 1, 1, 0},
		},
		{
			name:         "Example 3: Large jumps",
			temperatures: []int{30, 60, 90},
			want:         []int{1, 1, 0},
		},
		{
			name:         "Single day case",
			temperatures: []int{50},
			want:         []int{0},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := dailyTemperaturesWithStack(tt.temperatures)
			if !reflect.DeepEqual(got, tt.want) {
				t.Errorf("dailyTemperaturesWithStack() = %v, want %v", got, tt.want)
			}
		})
	}
}
