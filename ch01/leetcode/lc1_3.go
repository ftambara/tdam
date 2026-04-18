package main

import "slices"

func wiggleSort(nums []int) {
	slices.Sort(nums)
	// Split roughly in halves.
	// Due to truncation, len(secondHalf) >= len(firstHalf).
	middle := (len(nums) + 1) / 2
	firstHalf := nums[:middle]
	secondHalf := nums[middle:]
	slices.Reverse(firstHalf)
	slices.Reverse(secondHalf)

	// Build solution.
	result := make([]int, len(nums))

	for i := 0; i < len(secondHalf); i++ {
		result[2*i] = firstHalf[i]
		result[(2*i)+1] = secondHalf[i]
	}

	if len(firstHalf) > len(secondHalf) {
		// Add last item.
		result[len(nums)-1] = firstHalf[len(firstHalf)-1]
	}

	copy(nums, result)
}
