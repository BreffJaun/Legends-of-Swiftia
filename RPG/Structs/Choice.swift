//
//  Choice.swift
//  RPG
//
//  Created by Jeff Braun on 02.07.25.
//

import Foundation


struct Choice {
    let description: String
    let effect: (inout [Hero]) -> Void
    let consequenceText: String
}


