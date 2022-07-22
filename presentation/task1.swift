//
//  task1.swift
//  presentation
//
//  Created by Yusuke K on 2022-07-20.
//

import Foundation

func task1(_ stream : [Int],  _ M: Int, _ comparator: (Int, Int) -> Bool) -> [Int] {
    if stream.count < M { return stream } // When the length of stream doesn't go over M

    var m: [Int] = Array(repeating: 0, count: M)  // M space

    var i = 0

    while i < m.count {
       m[i] = stream[i]// fill up 'm'
        i+=1
    }
    
    // sort array
    buildHeap(&m, m.count, comparator)
    
    while i < stream.count {
        if comparator(m[0], stream[i]) {
            m[0] = stream[i]
            heapify(&m, m.count, 0, comparator)
        }
        i+=1
    }

    return m
}

// time complexity: O(n)
func buildHeap(_ arr: inout [Int], _ n :Int, _ comparator: (Int, Int) -> Bool) {
    for i in stride(from: n, through: 0, by: -1) {
        heapify(&arr, n, i, comparator)
    }
}

// heapify only works with sorted array
// time complexity: O(log n)
func heapify(_ arr: inout [Int], _ n: Int, _ i: Int, _ comparator: (Int, Int) -> Bool) {
    var parent = i // largest or smallest value
    let l = 2 * i + 1
    let r = 2 * i + 2
    
    if l < n && comparator(arr[l],arr[parent]) {
        parent = l
    }
    
    if r < n && comparator(arr[r],arr[parent]) {
        parent = r
    }
    
    if parent != i {
        let swap = arr[i];
        arr[i] = arr[parent]
        arr[parent] = swap
        heapify(&arr, n, parent,comparator)
    }
}
