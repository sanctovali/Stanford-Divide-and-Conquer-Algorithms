//
//  Runner.swift
//  Karatsuba's algorithm
//
//  Created by Valentin Kiselev on 6/24/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//

import Foundation

class Runner {
	static func runKaratsubaMultiply(for lhs: Int, and rhs: Int){
		var result: Int
		let startDate = Date()
		do {
			result = try karatsubaMultiply(lhs, rhs)
			let executionTime = Date().timeIntervalSince(startDate)
			print("The result of multiplication \(lhs) and \(rhs) is \(result)")
			print("Total execution time: \(executionTime)")
		} catch {
			print("An error occured: \(error.localizedDescription)")
		}
		
		
		
	}
}
