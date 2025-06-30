//
//  main.swift
//  Extensions
//
//  Created by Jeff Braun on 24.06.25.
//

import Foundation

extension String {
    func centered(padding width: Int) -> String {
        let totalPadding = max(0, width - self.count)
        let leftPadding = totalPadding / 2
        let rightPadding = totalPadding - leftPadding
        return String(repeating: " ", count: leftPadding) + self + String(repeating: " ", count: rightPadding)
    }
}

