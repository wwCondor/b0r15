//
//  ArrayMethod.swift
//  B0R15
//
//  Created by Wouter Willebrands on 30/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

struct ArrayMethod {
    // This handles rearrangement of the tiles after a swipe gesture
    static func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
        var arr = array
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)

        return arr
    }
    
    static func shuffleArray<T>(array: Array<T>) -> Array<T> {
        var arr = array
        arr.shuffle()
        
        return arr
    }
    
}