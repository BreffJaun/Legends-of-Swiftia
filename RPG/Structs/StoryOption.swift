//
//  StoryOption.swift
//  RPG
//
//  Created by Jeff Braun on 02.07.25.
//

import Foundation

struct StoryOption {
    let description: String
    let consequence: (Game) -> Void
}



