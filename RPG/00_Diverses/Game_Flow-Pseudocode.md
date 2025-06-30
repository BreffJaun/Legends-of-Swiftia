# Game Flow – Pseudocode

Start Game
    - Initialize heroes
    - Initialize final boss
    - Set game status to "Preparation"
    - Display intro text or cutscene

Set game status to "Battle"

While game status is not "Game Over":
    - Increase round counter
    - Print "Round X begins"

    - Display status of all heroes and enemies (HP, status effects, etc.)

    For each hero:
        - If hero is not knocked out:
            - Apply active status effects (e.g., poison damage)
            - If hero is still able to act:
                - Show action menu (Attack or Use Item)
                    - If Attack:
                        - Show attack menu
                        - Execute selected attack
                    - If Item:
                        - Open inventory
                        - Use selected item on target

    For each enemy:
        - Apply active status effects
        - If enemy can act:
            - Decide action (e.g., basic attack, area attack, summon minions)
            - Perform chosen action

    - Check HP of all heroes and enemies:
        - Remove defeated enemies
        - Mark knocked-out heroes as inactive

    - If boss HP < 50% and no minions summoned yet:
        - Summon minions

    - If all heroes are knocked out:
        - Set game status to "Game Over"
        - Display "Game Over" message

    - If all enemies are defeated:
        - Set game status to "Game Over"
        - Display "Victory!" message

End Game
    - Show ending text or cutscene
    - Display statistics (e.g., items used, enemies defeated, rounds played)

