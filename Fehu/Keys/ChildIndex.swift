//
//  ChildIndex.swift
//  Guardian
//
//  Created by Wolf McNally on 1/22/21.
//

import Foundation
import URKit

struct ChildIndex: ExpressibleByIntegerLiteral {
    let value: UInt32
    init(_ value: UInt32) throws {
        guard(value & 0x80000000 == 0) else {
            throw GeneralError("Invalid child index.")
        }
        self.value = value
    }
    
    init(integerLiteral: UInt32) {
        try! self.init(integerLiteral)
    }
    
    static func ==(lhs: ChildIndex, rhs: ChildIndex) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func <(lhs: ChildIndex, rhs: ChildIndex) -> Bool {
        return lhs.value < rhs.value
    }
    
    var cbor: CBOR {
        CBOR.unsignedInt(UInt64(value))
    }
    
    init?(cbor: CBOR) throws {
        guard case let CBOR.unsignedInt(value) = cbor else {
            return nil
        }
        guard value < 0x80000000 else {
            throw GeneralError("Invalid child index.")
        }
        try self.init(UInt32(value))
    }
}