//
//  InputHandler.swift
//  MergeSortWithComparisons
//
//  Created by Valentin Kiselev on 7/4/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//

import Foundation

enum StanfordAlgorithmsError: Error {

	case directory
	case parsing
	case converting
}

extension StanfordAlgorithmsError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .directory:
			return "The 'Documents' is inaccessible"
		case .parsing:
			return "There is an error occurred while parsing Input txt file"
		case .converting:
			return "Can't convert the contents of the Input txt file to the valid array of Ints"
		default:
			return "Some undefined error occurred. Please try again later"
		}
	}
}

class InputHandler {
	static var fileName = "arrayTest1.txt"
	
	static func loadIntsFromFile() throws -> [Int] {
		guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { throw  StanfordAlgorithmsError.directory }
		let fileURL = dir.appendingPathComponent(fileName)
		do {
			let text = try String(contentsOf: fileURL)
			let formatter = Formatter()
			return try formatter.format(text)
		} catch StanfordAlgorithmsError.parsing {
			throw StanfordAlgorithmsError.parsing
		} catch {
			throw StanfordAlgorithmsError.converting
		}
	}
	
}

class Formatter {

	func format(_ string: String) throws -> [Int] {
		
		let array = (string.replacingOccurrences(of: " ", with: "")).components(separatedBy: "\r\n")
		
		var arrayOfInts: [Int?] = []
		array.forEach{ arrayOfInts.append(Int($0)) }
		
		if arrayOfInts.contains(nil) { throw  StanfordAlgorithmsError.converting }
		
		return arrayOfInts.compactMap{$0}
	}
	
}
