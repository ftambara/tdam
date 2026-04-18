package main

type ListNode struct {
	Val  int
	Next *ListNode
}

func rotateRight(head *ListNode, k int) *ListNode {
	if k <= 0 || head == nil {
		return head
	}
	// Accumulate references in a list.
	references := []*ListNode{}

	tail := head
	for {
		references = append(references, tail)
		tail = tail.Next
		if tail == nil {
			break
		}
	}
	effectiveRot := k % len(references)
	if effectiveRot == 0 {
		return head
	}
	// Disconnect the link previous to that.
	references[len(references)-effectiveRot-1].Next = nil
	// Connect the old tail to the old head.
	references[len(references)-1].Next = head
	return references[len(references)-effectiveRot]
}
