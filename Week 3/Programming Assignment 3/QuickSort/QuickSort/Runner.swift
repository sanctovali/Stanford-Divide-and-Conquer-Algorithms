//
//  Runner.swift
//  QuickSort
//
//  Created by Valentin Kiselev on 7/4/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//

import Foundation

class Runner {
	
	enum InputContentsType {
		case random, fromFile
	}
	
	var contentsType: InputContentsType
	
	init(contentsType: InputContentsType) {
		self.contentsType = contentsType
	}
	
	func runQuickSort(pivot: Array<Int>.PivotElement) {
		var array = [Int]()
		do {
			array = try getArrayToSort()
		} catch {
			print(error.localizedDescription)
		}
		
		let startDate = Date()
		let (sortedArray, comparisons) = array.sortedWithComparisons(pivot: pivot)
		
		let executionTime = Date().timeIntervalSince(startDate)
		if sortedArray.count > 100 {
			print("First and last 20 elements from origin array: \n\(array.prefix( 20))...\(array.suffix(20))\n")
			print("First and last 20 elements from ordered array: \n\(sortedArray.prefix( 20))...\(sortedArray.suffix(20))\n")
			print("Total comparisons count is \(comparisons). Selected pivot is \(pivot)")
		} else {
			print("Origin array: \(array)")
			print("Ordered array: \(sortedArray)")
			print("Total comparisons count is \(comparisons). Selected pivot is \(pivot)")
		}
		print("Total execution time: \(executionTime)")
	}
	
	private func getArrayToSort() throws -> [Int] {
		switch contentsType {
		case .random:
			return generateArray(length: Int.random(in: 50...1000))
		case .fromFile:
			do {
				return try InputHandler.loadIntsFromFile()
			} catch {
				throw error
			}
		}
	}
	
	private func generateArray(length: Int) -> [Int] {
		var array = [Int]()
		for _ in 0..<length {
			array.append(Int.random(in: 1...length))
		}
		return array
	}
	
}
