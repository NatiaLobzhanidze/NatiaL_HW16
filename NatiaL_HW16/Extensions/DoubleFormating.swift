//
//  DoubleFormating.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import Foundation
let oneFormat = ".1"
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
