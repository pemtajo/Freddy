//
//  IntExtensions.swift
//  Freddy
//
//  Created by Volodymyr  Gorbenko on 2/6/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import Foundation

#if swift(>=3.2)
    public enum ArithmeticOverflow {

        public init(_ overflow: Bool) {
            self = overflow ? .overflow : .none
        }

        case none
        case overflow
    }

    extension Int {
        func multipliedReportingOverflow(other: Int) -> (partialValue: Int, overflow: ArithmeticOverflow) {
            let (value, overflow) = self.multipliedReportingOverflow(by: other)
            return (value, ArithmeticOverflow(overflow))
        }

        func addingReportingOverflow(other: Int) -> (partialValue: Int, overflow: ArithmeticOverflow) {
            let (exponent, overflow) = self.addingReportingOverflow(other)
            return (exponent, ArithmeticOverflow(overflow))
        }
    }
#else

public enum ArithmeticOverflow {

  public init(_ overflow: Bool) {
    self = overflow ? .overflow : .none
  }

  case none
  case overflow
}

extension Int {

  func multipliedReportingOverflow(other: Int) -> (partialValue: Int, overflow: ArithmeticOverflow) {
    let (exponent, overflow) = Int.multiplyWithOverflow(self, other)
    return (exponent, ArithmeticOverflow(overflow))
  }

  func addingReportingOverflow(other: Int) -> (partialValue: Int, overflow: ArithmeticOverflow) {
    let (exponent, overflow) = Int.addWithOverflow(self, other)
    return (exponent, ArithmeticOverflow(overflow))
  }
}

#endif
