//
//  Extension.swift
//  Boxes
//
//  Created by Alex on 06.02.16.
//  Copyright © 2016 oleksii. All rights reserved.
//
import Foundation
import Foundation

extension Range {
    
    var randomInt: Int {
        var offset = 0
        
        if (startIndex as! Int) < 0 {
            offset = abs(startIndex as! Int)
        }
        
        let mini = UInt32(startIndex as! Int + offset)
        let maxi = UInt32(endIndex   as! Int + offset)
        
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
    
    func randomIntExclude(array: [Int]) -> Int {
        var index: Int? = 0
        var randomInt = 0
        while index != nil {
            randomInt = (2...9).randomInt
            index = array.indexOf(randomInt)
        }
        return randomInt
    }
}

extension Array {
    func chooseOne() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}

extension RangeReplaceableCollectionType where Generator.Element : Equatable {
    mutating func removeObject(object : Generator.Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
}
