//
//  StorySteps.swift
//  RPG
//
//  Created by Jeff Braun on 03.07.25.
//

import Foundation


// MARK: DIFFERENT DIFFICULTY STORIES
extension Game {
    func easyStorySteps() -> [StoryStep] {
        return [
            // STEP 1
            StoryStep(
                title: "Step 1: Forest Edge",
                descriptionLines: [
                    "You stand at the entrance of the Emerald Grove.",
                    "Birdsong fades as thick vines line the path ahead.",
                    "Something unnatural clings to the air."
                ],
                choices: [
                    // FIGHT
                    Choice(
                        description: ["Approach the rustling bushes"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 2)
                        },
                        consequenceText: [
                            "As you step closer, two twisted rootlings leap out!",
                            "Their wooden claws slash through the air — fight!"
                        ]
                    ),
                    // ITEM
                    Choice(
                        description: ["Search the old satchel hanging on a tree"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Cracked Acorn", health: 5, damage: 0, defense: 2, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "Inside are dried rations and a few cracked acorns.",
                            "Each companion takes one and pockets it cautiously."
                        ]
                    ),
                    // STATUS
                    Choice(
                        description: ["Smell the glowing fungus nearby"],
                        effect: {
                            for hero in self.heroes {
                                let poison = StatusEffect(type: .poison, duration: 3)
                                hero.applyStatus(status: poison)
                            }
                            return true
                        },
                        consequenceText: [
                            "The sweet scent turns bitter in your lungs.",
                            "A sickly feeling creeps in — you've been poisoned."
                        ]
                    ),
                    // HARMLESS
                    Choice(
                        description: ["Sit on the mossy rock to rest a moment"],
                        effect: { return true },
                        consequenceText: [
                            "You sit in silence, the forest watching.",
                            "Nothing stirs—perhaps a moment of peace."
                        ]
                    )
                ]
            ),
            
            // TRANSITION SCENE 1
            StoryStep(
                title: "Transition: Deeper into the Forest",
                descriptionLines: [
                    "The sounds of the forest edge begin to fade.",
                    "Only the crunching of twigs underfoot remains.",
                    "The trees grow denser, the air heavier — you continue onward."
                ],
                choices: [
                    Choice(
                        description: ["Keep walking..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 2
            StoryStep(
                title: "Step 2: Overgrown Path",
                descriptionLines: [
                    "The trail narrows beneath entangled branches.",
                    "A strange hum rises with each step you take.",
                    "It’s like the forest itself is breathing."
                ],
                choices: [
                    // HARMLOS
                    Choice(
                        description: ["Carefully follow the footprints ahead"],
                        effect: { return true },
                        consequenceText: [
                            "The path remains clear—for now.",
                            "You press onward, undisturbed."
                        ]
                    ),
                    // ITEM
                    Choice(
                        description: ["Examine the bones beneath the ivy"],
                        effect: {
                            playSound(path: itemPickupSound)
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Ancient Talisman", health: 0, damage: 0, defense: 5, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "Among the remains you find a glowing talisman.",
                            "All companions claims it for protection."
                        ]
                    ),
                    // STATUS
                    Choice(
                        description: ["Whisper back at the forest hum"],
                        effect: {
                            if let hero = self.heroes.randomElement() {
                                let curse = StatusEffect(type: .curse, duration: 3)
                                hero.applyStatus(status: curse)
                            }
                            return true
                        },
                        consequenceText: [
                            "The forest answers in a voice not your own.",
                            "A chill grips your ally’s soul—they are cursed."
                        ]
                    ),
                    // FIGHT
                    Choice(
                        description: ["Clear the thick vines blocking your way"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "As you cut through, thornlings burst from the thicket!",
                            "They snarl in rage—battle is upon you."
                        ]
                    )
                ]
            ),
            // TRANSITION SCENE 2
            StoryStep(
                title: "Transition: Whispering Leaves",
                descriptionLines: [
                    "A cold breeze whispers through the leaves above.",
                    "It carries faint murmurs — perhaps voices, perhaps wind.",
                    "You press on, alert and silent."
                ],
                choices: [
                    Choice(
                        description: ["Stay focused and move on..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 3
            StoryStep(
                title: "Step 3: Whispering Clearing",
                descriptionLines: [
                    "You enter a misty glade where the air is unnaturally cold.",
                    "Voices seem to echo, though no one speaks."
                ],
                choices: [
                    // ITEM
                    Choice(
                        description: ["Inspect the altar covered in vines"],
                        effect: {
                            playSound(path: itemPickupSound)
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Wisp Essence", health: 0, damage: 15, defense: 0, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "You carefully collect glowing wisp essence.",
                            "Its power hums faintly in your pack."
                        ]
                    ),
                    // HARMLOS
                    Choice(
                        description: ["Sit in silence and listen"],
                        effect: { return true },
                        consequenceText: [
                            "The forest sighs around you.",
                            "Nothing stirs but the wind."
                        ]
                    ),
                    // FIGHT
                    Choice(
                        description: ["Call out to the voices"],
                        effect: {
                            return self.fight(minions: 2)
                        },
                        consequenceText: [
                            "Phantom shades emerge, cloaked in fog!",
                            "You draw your weapons instinctively."
                        ]
                    ),
                    // STATUS
                    Choice(
                        description: ["Touch the pool of still water"],
                        effect: {
                            for hero in self.heroes {
                                let freeze = StatusEffect(type: .freeze, duration: 3)
                                hero.applyStatus(status: freeze)
                            }
                            return true
                        },
                        consequenceText: [
                            "Your limbs go numb as the water flashes cold.",
                            "You're frozen in dread—temporarily immobilized."
                        ]
                    )
                ]
            ),
            // TRANSITION SCENE 3
            StoryStep(
                title: "Transition: Moss-Covered Paths",
                descriptionLines: [
                    "The path is now lined with thick moss and gnarled roots.",
                    "Every step feels uncertain, the ground soft and damp.",
                    "No turning back now."
                ],
                choices: [
                    Choice(
                        description: ["Continue forward..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 4
            StoryStep(
                title: "Step 4: Twisted Roots",
                descriptionLines: [
                    "The ground is cracked and roots pulse with unnatural energy.",
                    "Darkness coils in the soil beneath your boots."
                ],
                choices: [
                    // STATUS
                    Choice(
                        description: ["Place your hand on a pulsing root"],
                        effect: {
                            for hero in self.heroes {
                                let paralyze = StatusEffect(type: .paralyze, duration: 3)
                                hero.applyStatus(status: paralyze)
                            }
                            return true
                        },
                        consequenceText: [
                            "A surge of energy locks your muscles in place.",
                            "Your bodies resist movement—you are paralyzed."
                        ]
                    ),
                    // ITEM
                    Choice(
                        description: ["Examine the glowing cocoon in the roots"],
                        effect: {
                            playSound(path: itemPickupSound)
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Spider Silk Wrap", health: 10, damage: 0, defense: 3, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "Inside lies a glistening wrap of magical silk.",
                            "It might provide comfort—or entrapment."
                        ]
                    ),
                    // FIGHT
                    Choice(
                        description: ["Tread near the cracked earth"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 4)
                        },
                        consequenceText: [
                            "Burrowers erupt from the cracks, howling hungrily!",
                            "They are fast—you must react quickly!"
                        ]
                    ),
                    // HARMLOS
                    Choice(
                        description: ["Step carefully around the roots"],
                        effect: { return true },
                        consequenceText: [
                            "You avoid the shifting tendrils and move forward unharmed.",
                            "Best not to disturb what lies below."
                        ]
                    )
                ]
            ),
            // TRANSITION SCENE 4
            StoryStep(
                title: "Transition: The Heart of the Grove",
                descriptionLines: [
                    "Faint green light filters through the canopy.",
                    "The silence is almost sacred here, broken only by your breath.",
                    "Something ancient watches from the shadows."
                ],
                choices: [
                    Choice(
                        description: ["Step deeper into the grove..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 5
            // STEP 5: Duc & Dukas – Boss Enemies
            StoryStep(
                title: "Step 5: Duc & Dukas – Keepers of the Confused",
                descriptionLines: [
                    "The ground trembles beneath your feet.",
                    "Two massive figures break through the underbrush.",
                    "\"I am Duc...\" growls one. \"...and I am Dukas,\" finishes the other.",
                    "\"You have gone too far!\""
                ],
                choices: [
                    Choice(
                        description: ["Face Duc & Dukas in a battle!"],
                        effect: {
                            playSound(path: minionAttackSound)
                            let duc = Minion(name: "Duc", hp: 60)
                            let dukas = Minion(name: "Dukas", hp: 60)
                            return self.fight(minions: 0, presetEnemies: [duc, dukas])
                        },
                        consequenceText: [
                            "Duc raises his stone club and roars angrily",
                            "and Dukas slams the ground with thunderous force.",
                            "A fierce battle erupts!"
                        ]
                    ),
                ]
            ),
           
            // TRANSITION SCENE 6 – Epilogue
            StoryStep(
                title: "Transition: Sunbeams through the Mist",
                descriptionLines: [
                    "Duc and Dukas finally fall heavily to the ground.",
                    "The forest breathes a sigh of relief — silence returns.",
                    "A last sunbeam breaks through the branches, warming your faces.",
                    "",
                    "Relief floods through you.",
                    "You have survived — and triumphed."
                ],
                choices: [
                    Choice(
                        description: ["Leave the forest in peace"],
                        effect: { return true },
                        consequenceText: ["The heroes step out of the forest’s shadow into a new day."]
                    )
                ]
            )
        ]
    }

    func mediumStorySteps() -> [StoryStep] {
        return [
            // STEP 1
            StoryStep(
                title: "Step 1: Shadowed Entrance",
                descriptionLines: [
                    "You step into the Twilight Thicket.",
                    "Dim light filters through twisted branches above.",
                    "A heavy silence hangs in the air — unnatural and watchful."
                ],
                choices: [
                    Choice(
                        description: ["Follow the flickering shadow ahead"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "The shadow splits and lashes out — it's no trick of light!",
                            "Three lurking shades rush toward you from the dark!"
                        ]
                    ),
                    Choice(
                        description: ["Open the weathered satchel beneath the roots"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Mossy Bandage", health: 8, damage: 0, defense: 1, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "Inside you find old supplies: mossy bandages and dried herbs.",
                            "Each companion takes one — better than nothing."
                        ]
                    ),
                    Choice(
                        description: ["Touch the humming black crystal nearby"],
                        effect: {
                            for hero in self.heroes {
                                let paralyze = StatusEffect(type: .paralyze, duration: 2)
                                hero.applyStatus(status: paralyze)
                            }
                            return true
                        },
                        consequenceText: [
                            "Your hand trembles as you touch it.",
                            "A wave of dread clouds your mind — fear grips you."
                        ]
                    ),
                    Choice(
                        description: ["Pause to observe the strange fungi glowing faintly"],
                        effect: { return true },
                        consequenceText: [
                            "You take a moment to study the surroundings.",
                            "Nothing moves. But you feel something is watching from afar..."
                        ]
                    )
                ]
            ),
            
            // TRANSITION 1
            StoryStep(
                title: "Transition: Into the Murk",
                descriptionLines: [
                    "The twisted path darkens, branches clawing at your cloak.",
                    "The forest seems to fold inward, swallowing sound and light."
                ],
                choices: [
                    Choice(
                        description: ["Keep walking..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 2
            StoryStep(
                title: "Step 2: Whispering Shadows",
                descriptionLines: [
                    "Shadows move just beyond your sight.",
                    "Whispers tickle your ears, half-forgotten words in an unknown tongue.",
                    "The forest seems alive with secrets."
                ],
                choices: [
                    Choice(
                        description: ["Rest against an ancient tree"],
                        effect: { return true },
                        consequenceText: [
                            "The tree’s bark is rough but warm.",
                            "You feel a moment’s peace before the journey continues."
                        ]
                    ),
                    Choice(
                        description: ["Collect glowing berries from a twisted bush"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Glowing Berry", health: 5, damage: 0, defense: 0, usesLeft: 2))
                            }
                            return true
                        },
                        consequenceText: [
                            "The berries pulse softly.",
                            "Each companion pockets some, unsure if they’re safe to eat."
                        ]
                    ),
                    Choice(
                        description: ["Drink from a clear pool nearby"],
                        effect: {
                            for hero in self.heroes {
                                let poison = StatusEffect(type: .poison, duration: 2)
                                hero.applyStatus(status: poison)
                            }
                            return true
                        },
                        consequenceText: [
                            "The water tastes strange.",
                            "Your mind fogs, and you struggle to focus."
                        ]
                    ),
                    Choice(
                        description: ["Chase the whispering voices"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 2)
                        },
                        consequenceText: [
                            "You stumble into two shadow beasts, claws ready.",
                            "The fight begins in the dim light."
                        ]
                    ),
                    
                ]
            ),

            // TRANSITION 2
            StoryStep(
                title: "Transition: Narrowing Path",
                descriptionLines: [
                    "The path narrows, surrounded by gnarled branches.",
                    "The forest breathes around you, slow and steady."
                ],
                choices: [
                    Choice(
                        description: ["Keep walking..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 3
            StoryStep(
                title: "Step 3: The Hollow Clearing",
                descriptionLines: [
                    "You find a hollow where moonlight barely reaches.",
                    "The silence here is thick, pressing against your ears.",
                    "A sense of being watched prickles your skin."
                ],
                choices: [
                    Choice(
                        description: ["Gather fallen branches for a fire"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Charred Stick", health: 0, damage: 2, defense: 0, usesLeft: 3))
                            }
                            return true
                        },
                        consequenceText: [
                            "You collect dry branches, hoping to make a protective fire.",
                            "Charred sticks might serve as weapons or kindling."
                        ]
                    ),
                    Choice(
                        description: ["Investigate the faint glow on the ground"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 4)
                        },
                        consequenceText: [
                            "Suddenly, four shadow wolves leap from the underbrush!",
                            "Prepare to defend yourselves!"
                        ]
                    ),
                    Choice(
                        description: ["Meditate briefly, steady your breath"],
                        effect: { return true },
                        consequenceText: [
                            "You calm your racing heart.",
                            "The forest's tension feels a little less suffocating."
                        ]
                    ),
                    Choice(
                        description: ["Sniff the cold air deeply"],
                        effect: {
                            for hero in self.heroes {
                                let freeze = StatusEffect(type: .freeze, duration: 2)
                                hero.applyStatus(status: freeze)
                            }
                            return true
                        },
                        consequenceText: [
                            "A chill sinks deep.",
                            "Your fingers grow numb, slowing your reflexes."
                        ]
                    )
                ]
            ),

            // TRANSITION 3
            StoryStep(
                title: "Transition: Veil of Mist",
                descriptionLines: [
                    "A cold mist rolls in, blurring your vision.",
                    "The forest’s edge feels closer and farther all at once."
                ],
                choices: [
                    Choice(
                        description: ["Keep walking..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 4
            StoryStep(
                title: "Step 4: The Crooked Path",
                descriptionLines: [
                    "The trail twists sharply, roots threatening to trip you.",
                    "Strange markings are carved into the bark of every tree."
                ],
                choices: [
                    Choice(
                        description: ["Investigate the rustling in the bushes"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 2)
                        },
                        consequenceText: [
                            "Two forest wraiths emerge, eyes glowing red!",
                            "Battle is unavoidable."
                        ]
                    ),
                    Choice(
                        description: ["Apply bark salve for protection"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Bark Salve", health: 0, damage: 0, defense: 3, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "You rub a thick salve made from forest bark onto your skin.",
                            "It hardens quickly, forming a light armor against attacks."
                        ]
                    ),
                    Choice(
                        description: ["Take a deep breath and move carefully"],
                        effect: { return true },
                        consequenceText: [
                            "Your footsteps grow quiet.",
                            "You avoid making noise in the haunted woods."
                        ]
                    ),
                    Choice(
                        description: ["Stare too long at the shifting runes"],
                        effect: {
                            for hero in self.heroes {
                                let curse = StatusEffect(type: .curse, duration: 3)
                                hero.applyStatus(status: curse)
                            }
                            return true
                        },
                        consequenceText: [
                            "The runes twist unnaturally the longer you stare.",
                            "A dark energy seeps into your mind — you've been cursed."
                        ]
                    )
                ]
            ),


            // TRANSITION 4
            StoryStep(
                title: "Transition: Deep Shadows",
                descriptionLines: [
                    "The forest darkens as evening falls.",
                    "Shadows lengthen, wrapping around the trees like smoke."
                ],
                choices: [
                    Choice(
                        description: ["Keep walking..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 5
            StoryStep(
                title: "Step 5: The Hollowed Tree",
                descriptionLines: [
                    "An enormous tree stands hollowed at the base.",
                    "Strange runes glow faintly inside the cavity."
                ],
                choices: [
                    Choice(
                        description: ["Rest briefly in the tree’s shadow"],
                        effect: { return true },
                        consequenceText: [
                            "The cool shade refreshes your weary limbs.",
                            "A moment’s respite before the next trial."
                        ]
                    ),
                    Choice(
                        description: ["Reach inside the hollow"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "You disturb three lurking spirits guarding the tree!",
                            "A fierce fight ensues."
                        ]
                    ),
                    Choice(
                        description: ["Inspect the bark for clues"],
                        effect: {
                            for hero in self.heroes {
                                let curse = StatusEffect(type: .curse, duration: 3)
                                hero.applyStatus(status: curse)
                            }
                            return true
                        },
                        consequenceText: [
                            "You touch the bark and a dark force pulses through your hand.",
                            "Your thoughts are clouded — a curse lingers in your mind."
                        ]
                    ),
                    Choice(
                        description: ["Take one glowing rune from inside"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Glowing Rune", health: 0, damage: 1, defense: 1, usesLeft: 2))
                            }
                            return true
                        },
                        consequenceText: [
                            "You take a rune, feeling a slight boost of power.",
                            "Use it wisely."
                        ]
                    )
                ]
            ),

            // TRANSITION 5
            StoryStep(
                title: "Transition: The Broken Path",
                descriptionLines: [
                    "The trail becomes treacherous, roots broken and twisted.",
                    "Every step feels uncertain."
                ],
                choices: [
                    Choice(
                        description: ["Keep walking..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 6
            StoryStep(
                title: "Step 6: The Silent Pool",
                descriptionLines: [
                    "A still pool reflects the dim sky, perfectly calm.",
                    "The air here is thick with tension."
                ],
                choices: [
                    Choice(
                        description: ["Search the nearby reeds"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Reed Whistle", health: 0, damage: 0, defense: 1, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "You find a reed whistle, faint and fragile.",
                            "It might call aid if needed."
                        ]
                    ),
                    Choice(
                        description: ["Throw a stone into the pool"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "Ripples disturb the surface, awakening three water spirits!",
                            "They rise to challenge you."
                        ]
                    ),
                    Choice(
                        description: ["Drink from the pool"],
                        effect: {
                            for hero in self.heroes {
                                let poison = StatusEffect(type: .poison, duration: 3)
                                hero.applyStatus(status: poison)
                            }
                            return true
                        },
                        consequenceText: [
                            "The water tastes bitter and sharp.",
                            "Poison courses through your veins."
                        ]
                    ),
                    Choice(
                        description: ["Sit by the pool and meditate"],
                        effect: { return true },
                        consequenceText: [
                            "Calm washes over you.",
                            "The tension eases, if only for a moment."
                        ]
                    )
                ]
            ),

            // TRANSITION 6
            StoryStep(
                title: "Transition: Final Stretch",
                descriptionLines: [
                    "The forest seems to hold its breath.",
                    "A sense of finality looms just ahead."
                ],
                choices: [
                    Choice(
                        description: ["Press onward..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP : Martinius, the Exminer  – Boss Enemy
            StoryStep(
                title: "Final Step: Twilight Thicket",
                descriptionLines: [
                    "Shadows linger between twisted trees.",
                    "Domain of Martinius, the Examiner.",
                    "Prepare yourself for the ultimate challenge!"
                ],
                choices: [
                    Choice(
                        description: ["Face Martinius, the Examiner, Master of the Twilight Thicket"],
                        effect: {
                            playSound(path: minionAttackSound)
                            let martinius = Boss(curseDuration: 3, name: "Martinius, the Examiner", hp: 100, maxHp: 100)
                            return self.fight(minions: 0, presetEnemies: [martinius])
                        },
                        consequenceText: [
                            "\"Have you met all the requirements?\" Martinius demands.",
                            "You feel the pressure of his unyielding scrutiny.",
                            "Victory means surviving his judgement... or else."
                        ]
                    )
                ]
            ),
            
            // EPILOG
            StoryStep(
                title: "Epilog: Journey’s End",
                descriptionLines: [
                    "The forest opens onto a bright meadow.",
                    "Your trials are over, but the journey has changed you forever."
                ],
                choices: [
                    Choice(
                        description: ["Reflect on your journey"],
                        effect: { return true },
                        consequenceText: [
                            "You feel the weight of your choices and the power you gained.",
                            "A new chapter awaits."
                        ]
                    )
                ]
            )
        ]
    }

    func hardStorySteps() -> [StoryStep] {
        return [
            // Step 1
            StoryStep(
                title: "Step 1: The Whispering Entrance",
                descriptionLines: [
                    "You step into the forest, shadows shifting around you.",
                    "Whispers seem to echo from unseen mouths."
                ],
                choices: [
                    Choice(
                        description: ["Search the underbrush for useful herbs"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Healing Herb", health: 5, damage: 0, defense: 0, usesLeft: 2))
                            }
                            return true
                        },
                        consequenceText: [
                            "You find herbs that might heal wounds.",
                            "They may come in handy soon."
                        ]
                    ),
                    Choice(
                        description: ["Feel a sudden chill and brace yourself"],
                        effect: {
                            for hero in self.heroes {
                                let freeze = StatusEffect(type: .freeze, duration: 1)
                                hero.applyStatus(status: freeze)
                            }
                            return true
                        },
                        consequenceText: [
                            "A cold breath freezes your limbs.",
                            "You must endure a moment of paralysis."
                        ]
                    ),
                    Choice(
                        description: ["Move cautiously, trying not to alert any creatures"],
                        effect: { return true },
                        consequenceText: [
                            "You tread lightly, avoiding disturbance.",
                            "The forest seems quieter, for now."
                        ]
                    ),
                    Choice(
                        description: ["Attack the rustling noise suddenly"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 2)
                        },
                        consequenceText: [
                            "Two shadow wolves leap out from the bushes!",
                            "Prepare for battle!"
                        ]
                    )
                ]
            ),

            // TRANSITION 1
            StoryStep(
                title: "Transition: Deeper into the Abyss",
                descriptionLines: [
                    "The forest thickens, and the whispers grow louder.",
                    "You feel the weight of unseen eyes watching you."
                ],
                choices: [
                    Choice(
                        description: ["Keep moving forward..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // Step 2
            StoryStep(
                title: "Step 2: The Fogged Clearing",
                descriptionLines: [
                    "A clearing enveloped in dense fog appears.",
                    "Shapes flicker just beyond sight."
                ],
                choices: [
                    Choice(
                        description: ["Strike at a silhouette emerging from the mist"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "Mist spirits attack suddenly!",
                            "Prepare to fight!"
                        ]
                    ),
                    Choice(
                        description: ["Rest quietly and wait for the fog to clear"],
                        effect: { return true },
                        consequenceText: [
                            "The fog begins to thin, revealing the path ahead.",
                            "A moment to catch your breath."
                        ]
                    ),
                    Choice(
                        description: ["Pick up a strange glowing stone"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Glowing Stone", health: 0, damage: 1, defense: 1, usesLeft: 3))
                            }
                            return true
                        },
                        consequenceText: [
                            "The stone pulses faintly with energy.",
                            "You feel a spark of power."
                        ]
                    ),
                    Choice(
                        description: ["Suddenly feel your muscles stiffen"],
                        effect: {
                            for hero in self.heroes {
                                let paralyze = StatusEffect(type: .paralyze, duration: 1)
                                hero.applyStatus(status: paralyze)
                            }
                            return true
                        },
                        consequenceText: [
                            "Your limbs refuse to obey for a brief moment.",
                            "You’re temporarily paralyzed."
                        ]
                    )
                ]

            ),

            // TRANSITION 2
            StoryStep(
                title: "Transition: A Murmur in the Trees",
                descriptionLines: [
                    "The forest hums with a strange energy.",
                    "Branches seem to twitch like nervous fingers."
                ],
                choices: [
                    Choice(
                        description: ["Press onward..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // Step 3
            StoryStep(
                title: "Step 3: The Thorned Path",
                descriptionLines: [
                    "Thorns block your way, their tips sharp and glistening.",
                    "A faint magical glow pulses from within."
                ],
                choices: [
                    Choice(
                        description: ["Carefully maneuver through the thorns without disturbing them"],
                        effect: { return true },
                        consequenceText: [
                            "You avoid injury by moving slowly and cautiously.",
                            "The path remains passable."
                        ]
                    ),
                    Choice(
                        description: ["Take a thorn-covered dagger found on the ground"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Thorn Dagger", health: 0, damage: 3, defense: 0, usesLeft: 2))
                            }
                            return true
                        },
                        consequenceText: [
                            "You pick up the dagger, feeling its cruel edge.",
                            "It may prove useful."
                        ]
                    ),
                    Choice(
                        description: ["Slash at the dark shapes lurking nearby"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 2)
                        },
                        consequenceText: [
                            "Two thorn spirits attack you suddenly!",
                            "Defend yourself!"
                        ]
                    ),
                    Choice(
                        description: ["Feel a burning sensation spreading over your skin"],
                        effect: {
                            for hero in self.heroes {
                                let burn = StatusEffect(type: .burn, duration: 3)
                                hero.applyStatus(status: burn)
                            }
                            return true
                        },
                        consequenceText: [
                            "Your skin feels aflame.",
                            "Pain distracts your focus."
                        ]
                    )
                ]
            ),

            // TRANSITION 3
            StoryStep(
                title: "Transition: The Air Grows Heavy",
                descriptionLines: [
                    "A suffocating weight settles on your chest.",
                    "The forest seems to hold its breath."
                ],
                choices: [
                    Choice(
                        description: ["Continue despite the pressure..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // Step 4
            StoryStep(
                title: "Step 4: The Crystal Stream",
                descriptionLines: [
                    "A clear stream runs through the forest, shimmering oddly.",
                    "You sense magical properties within its waters."
                ],
                choices: [
                    Choice(
                        description: ["Prepare to fight when shadowy fish leap from the stream"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "Water elementals rise to defend their home!",
                            "Battle is unavoidable!"
                        ]
                    ),
                    Choice(
                        description: ["Collect a vial of the stream water"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Crystal Vial", health: 0, damage: 0, defense: 2, usesLeft: 2))
                            }
                            return true
                        },
                        consequenceText: [
                            "You fill a vial with the sparkling water.",
                            "It may have protective properties."
                        ]
                    ),
                    Choice(
                        description: ["Drink from the stream"],
                        effect: {
                            for hero in self.heroes {
                                let poison = StatusEffect(type: .poison, duration: 3)
                                hero.applyStatus(status: poison)
                            }
                            return true
                        },
                        consequenceText: [
                            "The water tastes bitter and sharp.",
                            "Poison courses through your veins."
                        ]
                    ),
                    Choice(
                        description: ["Rest on the bank, listening to the water’s song"],
                        effect: { return true },
                        consequenceText: [
                            "The sound soothes your spirit.",
                            "You regain a moment of calm."
                        ]
                    )
                ]
            ),

            // TRANSITION 4
            StoryStep(
                title: "Transition: A Sudden Stillness",
                descriptionLines: [
                    "The forest falls unnervingly silent.",
                    "Even the birds have ceased their songs."
                ],
                choices: [
                    Choice(
                        description: ["Move forward cautiously..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // Step 5
            StoryStep(
                title: "Step 5: The Ancient Oak",
                descriptionLines: [
                    "An enormous oak towers above you, its bark scarred by ancient battles.",
                    "Runes carved into its trunk faintly glow."
                ],
                choices: [
                    Choice(
                        description: ["Take a rune shard from the oak"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Rune Shard", health: 0, damage: 2, defense: 1, usesLeft: 2))
                            }
                            return true
                        },
                        consequenceText: [
                            "You pry a shard loose, feeling its latent power.",
                            "It might help in coming battles."
                        ]
                    ),
                    Choice(
                        description: ["Touch the bark and feel a curse settle on you"],
                        effect: {
                            for hero in self.heroes {
                                let curse = StatusEffect(type: .curse, duration: 4)
                                hero.applyStatus(status: curse)
                            }
                            return true
                        },
                        consequenceText: [
                            "Dark magic pulses through your veins.",
                            "A heavy curse weighs on your mind."
                        ]
                    ),
                    Choice(
                        description: ["Sit beneath the tree to catch your breath"],
                        effect: { return true },
                        consequenceText: [
                            "The oak’s presence steadies your nerves.",
                            "A moment of peace."
                        ]
                    ),
                    Choice(
                        description: ["Defend yourself from attacking tree spirits"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "Spirits erupt from the branches!",
                            "Fight for your life!"
                        ]
                    )
                ]
            ),

            // TRANSITION 5
            StoryStep(
                title: "Transition: The Shadows Deepen",
                descriptionLines: [
                    "The forest grows darker, shadows twisting unnaturally.",
                    "You sense something watching from the gloom."
                ],
                choices: [
                    Choice(
                        description: ["Step forward with determination..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // Step 6
            StoryStep(
                title: "Step 6: The Murmuring Hollow",
                descriptionLines: [
                    "The ground dips into a hollow filled with murmurs.",
                    "Voices of past travelers whisper warnings."
                ],
                choices: [
                    Choice(
                        description: ["Take a protective amulet from the ground"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Protective Amulet", health: 0, damage: 0, defense: 3, usesLeft: 2))
                            }
                            return true
                        },
                        consequenceText: [
                            "You feel a shield forming around you.",
                            "The amulet’s magic is strong."
                        ]
                    ),
                    Choice(
                        description: ["Feel a deep sadness overcome you"],
                        effect: {
                            for hero in self.heroes {
                                let curse = StatusEffect(type: .curse, duration: 2)
                                hero.applyStatus(status: curse)
                            }
                            return true
                        },
                        consequenceText: [
                            "Your strength wanes under the hollow’s sorrow.",
                            "You feel weaker."
                        ]
                    ),
                    Choice(
                        description: ["Silently observe the hollow’s eerie beauty"],
                        effect: { return true },
                        consequenceText: [
                            "The murmurs fade as you watch.",
                            "You steel your mind."
                        ]
                    ),
                    Choice(
                        description: ["Attack shadow wraiths emerging suddenly"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "Wraiths surge forth, claws sharp and cold!",
                            "Prepare for combat!"
                        ]
                    )
                ]
            ),

            // TRANSITION 6
            StoryStep(
                title: "Transition: The Distant Howl",
                descriptionLines: [
                    "A wolf’s howl echoes far off, unsettling your resolve.",
                    "The forest seems alive with menace."
                ],
                choices: [
                    Choice(
                        description: ["Keep moving despite the fear..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // Step 7
            StoryStep(
                title: "Step 7: The Broken Statue",
                descriptionLines: [
                    "A shattered statue lies half-buried in moss.",
                    "Its features worn but its gaze still piercing."
                ],
                choices: [
                    Choice(
                        description: ["Defend yourself against lurking shadow beasts"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "Beasts leap from the shadows!",
                            "Prepare for battle!"
                        ]
                    ),
                    Choice(
                        description: ["Take a moment to reflect on the lost past"],
                        effect: { return true },
                        consequenceText: [
                            "Memories flood your mind.",
                            "You steel your spirit."
                        ]
                    ),
                    Choice(
                        description: ["Salvage a broken sword fragment"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Sword Fragment", health: 0, damage: 4, defense: 0, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "The fragment feels sharp and deadly.",
                            "You clutch it tightly."
                        ]
                    ),
                    Choice(
                        description: ["Suddenly feel a numbness spreading through your limbs"],
                        effect: {
                            for hero in self.heroes {
                                let numb = StatusEffect(type: .freeze, duration: 2)
                                hero.applyStatus(status: numb)
                            }
                            return true
                        },
                        consequenceText: [
                            "Your body feels heavy and unresponsive.",
                            "You struggle to move."
                        ]
                    )
                ]
            ),

            // TRANSITION 7
            StoryStep(
                title: "Transition: The Forest Grows Still",
                descriptionLines: [
                    "The forest falls into a tense silence.",
                    "You sense a great challenge ahead."
                ],
                choices: [
                    Choice(
                        description: ["Prepare yourself mentally..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // Step 8
            StoryStep(
                title: "Step 8: The Glowing Portal",
                descriptionLines: [
                    "A swirling portal flickers between two ancient trees.",
                    "It hums with unstable energy."
                ],
                choices: [
                    Choice(
                        description: ["Step cautiously through the portal’s glow"],
                        effect: { return true },
                        consequenceText: [
                            "The air crackles with anticipation.",
                            "You steel yourself."
                        ]
                    ),
                    Choice(
                        description: ["Attack strange creatures emerging from the portal"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 4)
                        },
                        consequenceText: [
                            "Portal guardians appear!",
                            "Battle is upon you!"
                        ]
                    ),
                    Choice(
                        description: ["Take a shimmering shard from the portal’s edge"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Portal Shard", health: 0, damage: 2, defense: 2, usesLeft: 2))
                            }
                            return true
                        },
                        consequenceText: [
                            "You grasp the shard, its power coursing through you.",
                            "It might protect or empower."
                        ]
                    ),
                    Choice(
                        description: ["Suddenly feel your vision blur and head spin"],
                        effect: {
                            for hero in self.heroes {
                                let dizzy = StatusEffect(type: .paralyze, duration: 2)
                                hero.applyStatus(status: dizzy)
                            }
                            return true
                        },
                        consequenceText: [
                            "Your mind reels from the portal’s energy.",
                            "You struggle to focus."
                        ]
                    )
                ]
            ),

            // TRANSITION 8
            StoryStep(
                title: "Transition: The Final Approach",
                descriptionLines: [
                    "The path narrows, shadows clinging tightly.",
                    "A heavy silence falls as you near the heart of the abyss."
                ],
                choices: [
                    Choice(
                        description: ["Take a deep breath and proceed..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // Step 9
            StoryStep(
                title: "Step 9: The Forgotten Library",
                descriptionLines: [
                    "Dusty tomes and broken scrolls litter the floor.",
                    "Knowledge lost to time lingers in the air."
                ],
                choices: [
                    Choice(
                        description: ["Prepare to fight animated books attacking you"],
                        effect: {
                            playSound(path: minionAttackSound)
                            return self.fight(minions: 3)
                        },
                        consequenceText: [
                            "Books slam and whip like living creatures!",
                            "Defend yourself!"
                        ]
                    ),
                    Choice(
                        description: ["Feel a creeping madness trying to claim your mind"],
                        effect: {
                            for hero in self.heroes {
                                let madness = StatusEffect(type: .curse, duration: 3)
                                hero.applyStatus(status: madness)
                            }
                            return true
                        },
                        consequenceText: [
                            "Your thoughts swirl chaotically.",
                            "You fight to keep your sanity."
                        ]
                    ),
                    Choice(
                        description: ["Quietly study the runes etched into the walls"],
                        effect: { return true },
                        consequenceText: [
                            "The runes pulse faintly.",
                            "You feel knowledge and power welling up."
                        ]
                    ),
                    Choice(
                        description: ["Search the shelves for a helpful spell"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Ancient Spellbook", health: 0, damage: 3, defense: 0, usesLeft: 2))
                            }
                            return true
                        },
                        consequenceText: [
                            "You find arcane knowledge that might aid your quest.",
                            "The pages whisper secrets."
                        ]
                    )
                ]

            ),

            // TRANSITION 9
            StoryStep(
                title: "Transition: The Door to Doom",
                descriptionLines: [
                    "An imposing door stands before you, carved with ominous symbols.",
                    "The air vibrates with impending danger."
                ],
                choices: [
                    Choice(
                        description: ["Steel your nerves and step forward..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // Step 10: Justulor, Warden of Exams  – Boss Enemy
            StoryStep(
                title: "Final Step: The Office of Doom",
                descriptionLines: [
                    "You enter a dimly lit office filled with stacks of ungraded papers.",
                    "At the head of the cluttered desk sits Justulor, Warden of Exams.",
                    "He glares at you with a mix of tiredness and deadly seriousness.",
                    "Prepare yourself for the ultimate challenge!"
                ],
                choices: [
                    Choice(
                        description: ["Face Justulor, Warden of Exams, Boss of Eternal Deadlines"],
                        effect: {
                            playSound(path: minionAttackSound)
                            let justulor = Boss(curseDuration: 3, name: "Justulor, Warden of Exams", hp: 100, maxHp: 100)
                            return self.fight(minions: 0, presetEnemies: [justulor])
                        },
                        consequenceText: [
                            "\"Did you finish the homework?\" Justus growls.",
                            "You feel the weight of countless missed deadlines pressing down.",
                            "But victory means passing the course... or at least",
                            "surviving the lecture!"
                        ]
                    )
                ]
            ),

            // Epilog Step
            StoryStep(
                title: "Epilog: Journey’s End",
                descriptionLines: [
                    "The forest opens onto a bright meadow.",
                    "Your trials are over, but the journey has changed you forever."
                ],
                choices: [
                    Choice(
                        description: ["Reflect on your journey"],
                        effect: { return true },
                        consequenceText: [
                            "You feel the weight of your choices and the power you gained.",
                            "A new chapter awaits."
                        ]
                    )
                ]
            )
        ]
    }
    
    func fight(minions: Int, presetEnemies: [Enemy] = []) -> Bool {
        let player = self.heroes[0]
        let companions = self.heroes.dropFirst().filter { $0.isAlive() } // Dropped myself on index 0
        var hasShownBattleStand = false
        
        if minions > 0 {
            for i in 1...minions {
                self.enemies.append(Minion(name: "Minion \(i)", hp: 30))
            }
        } else if !presetEnemies.isEmpty {
            self.enemies += presetEnemies
        }
            
        boxedScreen(title: "Battle Start", lines: [
            "\(!companions.isEmpty ? "You and your companions " : "You " )are facing \(enemies.count) enemies!",
            "Prepare for battle!"
        ])
        pressEnterToContinue()
        
        
        while self.heroes.contains(where: { $0.isAlive() }) &&
                self.enemies.contains(where: { $0.isAlive() }) {
            
            
            if !hasShownBattleStand {
                boxedScreen(title: "Battle Stand", lines: getStatusLines(heroes: heroes, enemies: enemies))
                pressEnterToContinue()
                waitASec(sec: 1)
                hasShownBattleStand = true
            }
            
            // MARK: HERO ACTIONS
            for hero in self.heroes {
                checkGamePlayMusic()
                // Check if there are still enemies, so the other heroes don`t need to make thier round to fight against "nothing"
                if getLivingEnemies().isEmpty {
                    break
                }
                
                guard hero.canAct() else {
                    if let effect = hero.statusEffects.first(where: { $0.type == .freeze || $0.type == .paralyze }) {
                        print("\(hero.name) is \(effect.type.rawValue.capitalized) and cannot act this turn!")
                    } else {
                        print("\(hero.name) cannot act for unknown reason.")
                    }
                    pressEnterToContinue()
                    continue
                }
                
                
                boxedScreen(title: "Your Turn, \(hero.name)", lines: [
                    "Choose action:",
                    "",
                    "(1) ➤ Attack",
                    "\(hero is Warrior ? "(2) ➤ Power Strike" : hero is Magician ? "(2) ➤ Cast Fireball" : "(2) ➤ Mass Heal")",
                    "(3) ➤ Recharge \(hero is Warrior ? "endurance" : hero is Magician ? "mana" : "holy power")",
                    "",
                    "(b) ➤ Open bag",
                    "(q) ➤ Quit game"
                ])
                print("Enter [1] ➤ attack, [2] ➤ special attack, (b) ➤ Open bag, (q) ➤ Quit game: ", terminator: "")
                
                if let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                    if input.lowercased() == "b" {
                        playSound(path: openBagSound)
                        hero.bag.menu(currentHero: player)
                        continue
                    } else if input.lowercased() == "q" {
                        print("You decided to quit the game. Goodbye! ", terminator: "")
                        waitASec(sec: 1.5)
                        return false
                    } else if input == "1" {
                        let livingEnemies = self.enemies.enumerated().filter { $0.element.isAlive() }
                        let enemyLines = livingEnemies.map { "(\($0.offset + 1)) ➤ \($0.element.name) (HP: \($0.element.hp))" }
                        boxedScreen(title: "Choose Enemy", lines: enemyLines)
                        print("Enter [number] for choose enemy, (q) ➤ Quit game: ", terminator: "")
                        
                        if let input = readLine(), let inputNumber = Int(input),
                           inputNumber >= 1 && inputNumber <= livingEnemies.count {
                            let index = inputNumber - 1
                            let target = livingEnemies[index].element
                            hero.attack(target: target)
                            if hero is Warrior || hero is Magician || hero is Cleric {
                                hero.normalRecharge()
                            }                            
                            pressEnterToContinue()
                        } else if input.lowercased() == "q" {
                            print("You decided to quit the game. Goodbye! ", terminator: "")
                            waitASec(sec: 1.5)
                            return false
                        } else {
                            print("Invalid input. Please try again: ", terminator: "")
                            waitASec(sec: 1)
                        }
                    } else if input == "2" {
                        // Setting enemies with index (for visual presentation) and without for the code syntax
                        let livingEnemiesWithIndex = self.enemies.enumerated().filter { $0.element.isAlive() }
                        let livingEnemies = self.enemies.filter { $0.isAlive() }

                        // Setting heroes without index because we didn´t need to show them for selection
                        let livingHeroes = self.heroes.filter { $0.isAlive() }
                        
                        switch hero {
                        case let warrior as Warrior:
                            let enemyLines = livingEnemiesWithIndex.map { "(\($0.offset + 1)) ➤ \($0.element.name) (HP: \($0.element.hp))" }
                            boxedScreen(title: "Choose Enemy", lines: enemyLines)
                            print("Enter [number] for choose enemy, (q) ➤ Quit game: ", terminator: "")
                            if let input = readLine(), let inputNumber = Int(input),
                               inputNumber >= 1 && inputNumber <= livingEnemies.count {
                                let index = inputNumber - 1
                                let target = livingEnemiesWithIndex[index].element
                                warrior.powerStrike(target: target)
                            }  else if input.lowercased() == "q" {
                                print("You decided to quit the game. Goodbye! ", terminator: "")
                                waitASec(sec: 1.5)
                                return false
                            } else {
                                print("Invalid input. Please try again: ", terminator: "")
                                waitASec(sec: 1)
                            }
                            pressEnterToContinue()
                        case let magician as Magician:
                            magician.castFireball(enemies: livingEnemies)
                            pressEnterToContinue()
                        case let cleric as Cleric:
                            cleric.massHeal(heroes: livingHeroes)
                            pressEnterToContinue()
                        default:
                            break
                        }
                    } else if input == "3" {
                        hero.skipToRecharge()
                        pressEnterToContinue()
                    } else {
                        print("Invalid input. Please try again: ", terminator: "")
                        waitASec(sec: 1)
                    }
                }
                self.heroes = getLivingHeroes()
                self.enemies = getLivingEnemies()
            }
            
            if !self.enemies.isEmpty {
                boxedScreen(title: "After Allies Turn", lines: getStatusLines(heroes: self.heroes, enemies: self.enemies))
                pressEnterToContinue()
                waitASec(sec: 1)
                
                // MARK: ENEMY ACTIONS
                for enemy in self.enemies {
                    if let target = self.heroes.randomElement() {
                        boxedScreen(title: "\(enemy.name)'s Turn", lines: [
                            "\(enemy.name) attacks \(target.name)!"
                        ])
                        if let newMinions = enemy.randomAttack(target: target, heroes: self.heroes) {
                            self.enemies.append(contentsOf: newMinions)
                        }
                        pressEnterToContinue()
                    }
                    
                }
                
                updateCombatState()
                
                if !heroes.isEmpty {
                    boxedScreen(title: "After Enemy Turn", lines: getStatusLines(heroes: self.heroes, enemies: self.enemies))
                    pressEnterToContinue()
                } else {
                    continue
                }
            } else {
                continue
            }
            
        }
        if heroes.contains(where: { $0.isAlive() }) {
            boxedScreen(title: "Victory!", lines: ["You have defeated all enemies."])
            return true
        } else {
            boxedScreen(title: "Defeat!", lines: ["Your party has fallen in battle."])
            return false
        }
    }
    
    func getStatusLines(heroes: [Hero], enemies: [Enemy]) -> [String] {
        var lines: [String] = []
        lines += ["-=== Your  Party ===-", ""]
        for hero in heroes {
            if let warrior = hero as? Warrior {
                lines.append("\(warrior.name): \(warrior.hp)/\(warrior.maxHp) HP | \(warrior.endurance)/\(warrior.maxEndurance) EN")
            } else if let magician = hero as? Magician {
                lines.append("\(magician.name): \(magician.hp)/\(magician.maxHp) HP | \(magician.mana)/\(magician.maxMana) MA")
            } else if let cleric = hero as? Cleric {
                lines.append("\(cleric.name): \(cleric.hp)/\(cleric.maxHp) HP | \(cleric.holyPower)/\(cleric.maxHolyPower) HO")
            } else {
                lines.append("\(hero.name): \(hero.hp)/\(hero.maxHp) HP | --/??")
            }
        }

        lines += ["", "---------------------", "", "-===   Enemies   ===-", ""]
        for enemy in enemies {
            if let minion = enemy as? Minion {
                lines.append("\(minion.name): \(minion.hp)/\(minion.maxHp) HP | \(minion.endurance)/\(minion.maxEndurance) EN")
            } else if let boss = enemy as? Boss {
                lines.append("\(boss.name): \(boss.hp)/\(boss.maxHp) HP | \(boss.endurance)/\(boss.maxEndurance) EN | \(boss.mana)/\(boss.maxMana) MA")
            }
        }
        return lines
    }
    
    func getLivingEnemies() -> [Enemy] {
        return enemies.filter { $0.isAlive() }
    }
    
    func getLivingHeroes() -> [Hero] {
        return heroes.filter { $0.isAlive() }
    }
    
    func updateCombatState() {
        for hero in self.heroes where !hero.statusEffects.isEmpty {
            hero.processStatusEffects()
        }
        self.heroes = getLivingHeroes()
        self.enemies = getLivingEnemies()
    }

    
    func randomStatusEffect() -> StatusEffectType {
        let statusEffects: [StatusEffectType] = [.poison, .paralyze, .burn, .freeze, .curse]
        return statusEffects.randomElement()!
   }
    
    func checkGamePlayMusic() {
        if difficulty == .easy {
            playSound(path: gameplayEasySound, loops: -1, volume: 0.05)
        } else if difficulty == .medium {
            playSound(path: gameplayMediumSound, loops: -1, volume: 0.05)
        } else {
            playSound(path: gameplayHardSound, loops: -1, volume: 0.05)
        }
    }
    
}
