//
//  Runner.swift
//  MergeSort
//
//  Created by Valentin Kiselev on 6/24/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//

import Foundation

class Runner {
	
	static func runMergeSort(order: (Int, Int) -> Bool, arrayLegth: Int) {
		let array = generateArray(length: arrayLegth)
		let startDate = Date()
		let sortedArray = array.sorted(order)

		let executionTime = Date().timeIntervalSince(startDate)
		if arrayLegth > 100 {
			print("First and last 20 elements from origin array: \n\(array.prefix( 20))...\(array.suffix(20))\n")
			print("First and last 20 elements from ordered array: \n\(sortedArray.prefix( 20))...\(sortedArray.suffix(20))\n")
		} else {
			print("Origin array: \(array)")
			print("Ordered array: \(sortedArray)")
		}
		print("Total execution time: \(executionTime)")
	}
	
	
	private static func generateArray(length: Int) -> [Int] {
		var array = [Int]()
		for _ in 0..<length {
			array.append(Int.random(in: 1...length))
		}
		return array
	}
}



