## Legends of Swiftia
<img src=RPG/img/mainMenu_screenshot.png width=75%>

## 🧙‍♂️ Game Description

**Legends of Swiftia** is a turn-based text RPG built in Swift. The player takes control of a main hero—either a **Warrior**, **Magician**, or **Cleric**—and ventures into a dark, mysterious fantasy realm. Each class offers unique abilities and perspectives that shape the journey and influence the unfolding story.

The world of Swiftia is divided into three treacherous regions:

    Emerald Grove, a bright and welcoming forest. Home of Duc & Dukas, Keepers of the Confused.

    Twilight Thicket, where shadows linger between twisted trees. Domain of Martinius, the Examiner..

    Whispering Abyss, where only the brave dare enter. Where Justulor, Warden of Exams, awaits...

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
   - Game over and victory states trigger sound effects.

7. **Player Input**  
   - Menu choices: Keys 1–4  
   - Open bag: `b`  
   - Quit game: `q`
   - To continue: `Enter`

---

## 🛠️ How to Play

### ▶️ Option 1: Run with Xcode (Recommended for macOS users)

1. Open the GitHub repository.
2. Click **Code** > **Open with Xcode** (Xcode must be installed).
3. In Xcode, ensure `main.swift` is selected as the entry point.
4. Click the **Play** button (or press `Cmd + R`) to run the game in the terminal window.

> 💡 Tip: If the play button is disabled, make sure the correct build target is selected in the top scheme menu.

---

### 🧪 Option 2: Run the Built Game Manually via Terminal

If you prefer to clone and run the project manually:

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/legends-of-swiftia.git
   cd legends-of-swiftia
   
2. Open the project in Xcode and build it once (Cmd + B).

3. Navigate to the following folder:

```
/Users/<your-username>/Library/Developer/Xcode/DerivedData/<ProjectName>/Build/Products/Debug/
```

4. Locate the Unix executable file (e.g., LegendsOfSwiftia).

5. Open Terminal and run the game with:

```
./LegendsOfSwiftia
```

⚠️ Note: On first run, macOS might prompt for permissions (e.g., Terminal access). Allow them to ensure the game runs properly.

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


