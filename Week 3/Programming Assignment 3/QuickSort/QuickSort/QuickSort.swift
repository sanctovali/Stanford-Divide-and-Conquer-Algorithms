//
//  QuickSort.swift
//  QuickSort
//
//  Created by Valentin Kiselev on 7/2/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//

import Foundation



extension Array where Element: Comparable {
	
	func sortedWithComparisons(pivot: PivotElement) -> ([Element], Int) {
		guard count > 1 else { return (self, 0) }

		let pivotIndex = getPivotIndex(for: pivot)
		let pivotElement = self[pivotIndex]

		let (lessArray, lessCount) = Array(self.filter {$0 < pivotElement}).sortedWithComparisons(pivot: pivot)
		let equal = self.filter {$0 == pivotElement}
		let (greaterArray, greaterCount) = Array(self.filter {$0 > pivotElement}).sortedWithComparisons(pivot: pivot)
		
		return (lessArray + equal + greaterArray, self.count - 1 + lessCount + greaterCount)
	}
	
	private func getPivotIndex(for pivot: PivotElement) -> Int {
		switch pivot {
		case .first:
			return 0
		case .last:
			return count - 1
		default:
			return getMedianIndex()
		}
	}
	
	private func getMedianIndex() -> Int {
		guard self.count > 2 else { return 0 }
		
		let first = self.first!
		let last = self.last!
		let middle = self[middleIndex]
		
		if ((first < middle && middle < last) || (last < middle && middle < first)) {
			return middleIndex
		} else if ((middle < first && first < last) || (last < first && first < middle)) {
			return 0
		} else {
			return self.count - 1
		}
	}
	
	private var middleIndex: Int {
		let lenght = self.count
		return lenght % 2 == 0 ? lenght / 2 - 1 : lenght / 2
	}
	
}

extension Array {
	enum PivotElement {
		case first, median, last
	}
}
