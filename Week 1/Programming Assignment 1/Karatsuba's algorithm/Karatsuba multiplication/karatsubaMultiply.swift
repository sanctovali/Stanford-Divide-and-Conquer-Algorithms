//
//  raratsubaMultiply.swift
//  Karatsuba's algorithm
//
//  Created by Valentin Kiselev on 6/24/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//

import Foundation

enum KaratsubaMultiplicationError: Error {

	case IntegerOverflow
}

/*
Karatsuba Multiplication: Pseudocode
 - Recursively compute ac
 - Recursively compute bd
 - Recursively compute (ab + bd) = ac + bd + ad + bc
*/

extension KaratsubaMultiplicationError: LocalizedError {
	var errorDescription: String? {
		return "The value is too large"
	}
}

func karatsubaMultiply(_ lhs: Int, _ rhs: Int) throws -> Int  {
	
	guard !lhs.isDigit && !rhs.isDigit else {
		return lhs * rhs
	}
	
	let maxLenght = max(String(lhs).count, String(rhs).count)
	let middleIndex = maxLenght / 2
	
	let a = lhs / 10.power(middleIndex)
	let b = lhs % 10.power(middleIndex)
	let c = rhs / 10.power(middleIndex)
	let d = rhs % 10.power(middleIndex)
	
	let ac = try karatsubaMultiply(a, c)
	let bd = try karatsubaMultiply(b, d)
	let adPlusbc = try karatsubaMultiply(a+b, c+d) - ac - bd
	let (acResult, overflowAC) = ac.multipliedReportingOverflow(by: 10.power(2*middleIndex))
	let (adPlusbcResult, overflowADPlusBC) = adPlusbc.multipliedReportingOverflow(by: 10.power(middleIndex))
	
	if overflowAC || overflowADPlusBC {
		throw KaratsubaMultiplicationError.IntegerOverflow
	}
	return acResult + adPlusbcResult + bd
}
