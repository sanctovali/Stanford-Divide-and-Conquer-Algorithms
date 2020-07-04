//
//  MergeSort.swift
//  MergeSortWithComparisons
//
//  Created by Valentin Kiselev on 7/4/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
	
	func mergeSortWithInversionCounts() -> ([Element], Int) {
		guard self.count > 1 else { return (self, 0) }
		
		let middleIndex = self.count / 2
		
		let (lhsArray, lhsInversionsCount) = Array(self[0..<middleIndex]).mergeSortWithInversionCounts()
		let (rhsArray, rhsInversionsCount) = Array(self[middleIndex..<self.count]).mergeSortWithInversionCounts()
		let (orderedArray, inversionsCount) = merge(lhsArray, rhsArray)
		
		return (orderedArray, inversionsCount + lhsInversionsCount + rhsInversionsCount)
	}

	func merge(_ lhs: [Element], _ rhs: [Element]) -> ([Element], Int) {
		var orderedArray: [Element] = []
		var lhsIndex = 0
		var rhsIndex = 0
		var inversionsCount = 0
		
		repeat {
			let leftElement = lhs[lhsIndex]
			let rightElement = rhs[rhsIndex]
			
			if leftElement < rightElement {
				orderedArray.append(leftElement)
				lhsIndex += 1
			} else if leftElement > rightElement {
				orderedArray.append(rightElement)
				rhsIndex += 1
				inversionsCount += lhs.count - lhsIndex
			}
		} while lhsIndex < lhs.count && rhsIndex < rhs.count
		
		while lhsIndex < lhs.count {
			orderedArray.append(lhs[lhsIndex])
			lhsIndex += 1
		}
		
		while rhsIndex < rhs.count {
			orderedArray.append(rhs[rhsIndex])
			rhsIndex += 1
		}
		return (orderedArray, inversionsCount)
	}
	
}
