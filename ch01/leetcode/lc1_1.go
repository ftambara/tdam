package main

func dailyTemperatures(temperatures []int) []int {
	answer := make([]int, len(temperatures))
	for i := 0; i < len(temperatures)-1; i++ {
		for j := i + 1; j < len(temperatures); j++ {
			iTemp := temperatures[i]
			jTemp := temperatures[j]
			if jTemp > iTemp {
				answer[i] = j - i
				break
			}
		}
		// Otherwise, answer[i] will be zero by default.
	}
	return answer
}

// Note: This was not my original idea. I went off with this suggestion:
//
// Imagine you are walking through the days. If today is colder than yesterday,
// you don't know when a warmer day will come, so you "remember" yesterday by
// putting its index on a stack.
//
// This is my mostly unbiased implementation of that statement.

func dailyTemperaturesWithStack(temperatures []int) []int {
	// Stack of days for which we haven't found a greater temperature.
	pendingDays := []int{0} // The first day will always be pending.
	answer := make([]int, len(temperatures))

	for thisDay := 1; thisDay < len(temperatures); thisDay++ {
		thisTemp := temperatures[thisDay]
		for j := len(pendingDays) - 1; j >= 0; j-- {
			pendingDay := pendingDays[j]
			pendingTemp := temperatures[pendingDay]
			if pendingTemp >= thisTemp {
				// Nothing else to resolve, this day's temperature is
				// too low to go on.
				break
			}

			answer[pendingDay] = thisDay - pendingDay
			// Pop the last element out.
			pendingDays = pendingDays[:len(pendingDays)-1]
		}
		pendingDays = append(pendingDays, thisDay)
	}
	// For all remaining pendingDays, answer[i] will be zero by default.
	return answer
}
