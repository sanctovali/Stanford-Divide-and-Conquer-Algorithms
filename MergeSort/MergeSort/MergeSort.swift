//
//  MergeSort.swift
//  MergeSort
//
//  Created by Valentin Kiselev on 6/24/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//
import Foundation
/*
	Merge Sort: Pseudocode
- recursively sort 1st half of the input
- recursively sort 2nd half of the input
- merge two sorted sublists into one
- base case : input length is 1
*/

/*
	Pseudocode for merge:
- orderedArray = output[length = n]
- lhs = 1st sorted array [length = n/2]
- rhs = 2nd sorted array [length = n/2]
- leftIndex = 0 is for lhs
- rightIndex = 0 is for rhs

for k = 1 to n
	if lhs[leftIndex] < rhs[rightIndex]
		orderedArray[k] = lhs[leftIndex]
		leftIndex += 1
	else lhs[leftIndex] > rhs[rightIndex]
		orderedArray[k] = rhs[rightIndex]
		rightIndex += 1

	add end cases to output
*/



extension Array where Element: Comparable {
	
	func sorted(_ expression: (Element, Element) -> Bool) -> [Element] {
		guard self.count > 1 else { return self }
		let middleIndex = self.count / 2
		
		let lhsArray = Array(self[0..<middleIndex]).sorted(expression)
		let rhsArray = Array(self[middleIndex..<self.count]).sorted(expression)
		
		return merge(lhsArray, rhsArray, order: expression)
	}
	
	private func merge(_ lhs: [Element], _ rhs: [Element], order: (Element, Element) -> Bool) -> [Element] {
		var leftIndex = 0
		var rightIndex = 0
		
		var orderedArray: [Element] = []
		
		while leftIndex < lhs.count && rightIndex < rhs.count {
			let leftElement = lhs[leftIndex]
			let rightElement = rhs[rightIndex]
			
			if order(leftElement, rightElement) {
				orderedArray.append(leftElement)
				leftIndex += 1
			} else {
				orderedArray.append(rightElement)
				rightIndex += 1
			}
		}
		
		while leftIndex < lhs.count {
			orderedArray.append(lhs[leftIndex])
			leftIndex += 1
		}
		
		while rightIndex < rhs.count {
			orderedArray.append(rhs[rightIndex])
			rightIndex += 1
		}
		
		return orderedArray
	}
	
}
