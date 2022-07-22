//
//  main.swift
//  presentation
//
//  Created by Yusuke K on 2022-07-20.
//

import Foundation

//print("start of index is \(KMP("AAAXAAAA", "AAAA"))")
//print("start of index is \(KMP("INAHAYSTACKNEEDLEINA", "NEEDLE"))")
//print("start of index is \(KMP("ONIONIONS", "ONIONS"))")


//var a = [1, 3, 5, 4, 6, 13,
//         10, 9, 8, 15, 17]
//
//buildHeap(&a, a.count, >)
//
//print(a)

//print(task1([1,2,3,-3,-3,10, 11], 3, <)) //largest
var a = [1,2,3,-3,-3,10]
 
buildHeap(&a, a.count, > )
print(a)
print(task1([1,2,3,-3,-3,10], 2, >)) //smallest
