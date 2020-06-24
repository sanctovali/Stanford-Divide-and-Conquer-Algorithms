//
//  main.swift
//  MergeSort
//
//  Created by Valentin Kiselev on 6/24/20.
//  Copyright © 2020 Valianstin Kisialiou. All rights reserved.
//
// Pseudocode you may find at MergeSort.swift

import Foundation

let order: (Int, Int) -> Bool = {$0 < $1} // The way array will be sorted
let arraylength = 152 // The elements count of the array to sort

Runner.runMergeSort(order: order, arrayLegth: arraylength)

