//
//  Int+Extension.swift
//  Karatsuba's algorithm
//
//  Created by Valentin Kiselev on 6/24/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//

import Foundation

extension Int {
	var isDigit: Bool {
		return abs(self) < 10
	}
	func power(_ power: Int) -> Int {
		return Int(pow(Double(self), Double(power)))
	}
}
