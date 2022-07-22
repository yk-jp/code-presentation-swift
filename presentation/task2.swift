//
//  task2.swift
//  presentation
//
//  Created by Yusuke K on 2022-07-20.
//

import Foundation

/**
  O(2*n)    e.g  (AAAAAX)
 */

func createPrefixTable(_ target: String) -> [Int] {
    var lps : [Int] = Array(repeating: 0, count: target.count)
    
    var prevLps = 0, i = 1 // prevLPS means that the first position is gonna be 0.
    
    while i < target.count {
        // if caracters mactch with each other
        if target[i] == target[prevLps] {
            lps[i] = prevLps + 1
            prevLps+=1
            i+=1
        }
        else if prevLps == 0 { lps[i] = 0 ; i+=1 }
        else { prevLps = lps[prevLps - 1] }
    }
    return lps
}

/**
 Find the substring pattern of length M in a text of length N. (Assume that N >= M)
 (Return the index of the starting index)
*/

func KMP(_  text : String, _ target: String) -> Int {
    if target.isEmpty { return 0 }
    
    // create a table of longest prefix and suffix
    let lps: [Int] = createPrefixTable(target)
    print("lps = \(lps)")
    
    var textIdx = 0, targetIdx = 0
    
    while textIdx < text.count {
        if text[textIdx] == target[targetIdx] {
            textIdx+=1 ; targetIdx+=1
        }
        else {
            if targetIdx == 0 { textIdx+=1 } else { targetIdx = lps[targetIdx-1] }
        }
        
        // prevent from out of bounds
        if targetIdx == target.count {
            return textIdx - target.count
        }
    }
    
    return -1
}
