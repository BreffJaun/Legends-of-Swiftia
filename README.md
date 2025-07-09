## Legends of Swiftia
<img src=RPG/img/mainMenu_screenshot.png width=75%>

## 🧙‍♂️ Game Description

**Legends of Swiftia** is a turn-based text RPG built in Swift. The player takes control of a main hero—either a **Warrior**, **Magician**, or **Cleric**—and ventures into a dark, mysterious fantasy realm. Each class offers unique abilities and perspectives that shape the journey and influence the unfolding story.

The world of Swiftia is divided into three treacherous regions:

    Emerald Grove, a lush but cursed forest teeming with corrupted beasts.

    Crimson Thicket, a blood-red woodland haunted by vengeful spirits.

    Obsidian Hollow, a shadow-cloaked wilderness ruled by ancient evils.

In each forest, players face challenging enemies and must overcome a powerful boss—culminating in the final confrontation against Justulor, a malevolent force threatening all of Swiftia.

With branching narrative choices, strategic stat-based combat, and minimalist inventory management, Legends of Swiftia delivers an immersive RPG experience—all within the terminal. The game’s interface leverages custom-rendered text boxes and paginated menus for a visually structured, interactive journey.

---

## 🎮 Gameplay Flow
<img src=RPG/img/gameplay_screenshot.png width=75%>

1. **Game Initialization**  
   - The game starts with the `Game` class initializing the main components: player character, companions, inventory (bag), enemy, and the story system.
   - The player selects a class: Warrior, Magician, or Cleric.

2. **Story Progression**  
   - The story is presented in text-based scenes.
   - Players make decisions by choosing from numbered options (1–4).
   - Certain decisions affect hero stats, companion status, or trigger battles.

3. **Combat System**  
   - Turn-based: Each hero and enemy acts in order.
   - Heroes and enemies have HP, damage, and defense values.
   - Actions include attacking, healing (for Clerics), and inventory use.
   - Battle ends when either side’s HP reaches 0.

4. **Companions**  
   - Heroes can acquire companions with their own stats and behavior.
   - Companions assist in battles and story events.
   - If a companion dies, they are removed from the party.

5. **Inventory System**  
   - Accessible during combat by pressing **'b'**.
   - Contains healing items, mana potions, and equipment.
   - Items can be used on the player or allies.

6. **Game Over / Victory**  
   - The game ends if the player’s HP reaches 0.
   - A victory message is displayed if the player completes all required events or defeats the final enemy.
   - Game over and victory states trigger corresponding sound effects.

7. **Player Input**  
   - Menu choices: Keys 1–4  
   - Open bag: `b`  
   - Quit game: `q`

---

## ⚙️ Technical Details

- **Language:** Swift (latest version)
- **Entry Point:** `main.swift`
- **Core Class:** `Game.swift`
- **Architecture:**  
  - `Game` orchestrates flow between combat, story, and input.
  - Modular classes for `Hero`, `Enemy`, `Companion`, `Bag`, `Item`, and `Story`.
  - `Sounds.swift` handles audio playback (if used).
- **Combat System:** Turn-based with initiative based on array order.
- **Input Handling:** Via `readLine()` from the command line.
- **Audio:** Optional audio support for game events (`playSound(name:)` method).
- **Display:** Terminal-based interface using framed output (`boxedScreen`) and paginated views (`pagedBox`) for a structured, interactive experience.
- **State Management:** Runtime only; no save/load yet implemented.


