//
//  StoryStep.swift
//  RPG
//
//  Created by Jeff Braun on 02.07.25.
//

import Foundation


//struct StoryStep {
//    let title: [String]
//    let choices: [String]
//    let outcomes: [[String]]
//    let continueMessage: [String]
//}

// intro -> boxedScreen Intro
// choices -> 4 Auswahlmöglichkeiten
// outcomes -> 4x boxedScreen Texte
// continueMessage // "You move deeper..."

// =========================================

struct StoryStep {
    let title: String
    let descriptionLines: [String]
    let choices: [Choice]
}

