# Hangman Game

Welcome to the command line Hangman game! This Ruby script allows one player to play against the computer, guessing a randomly selected word between 5 and 12 characters.

## How to Play

1. **Run the Game:**
   - Make sure you have Ruby installed on your machine.
   - Download the script (`hangman.rb`) and the dictionary file (`google-10000-english-no-swears.txt`).
   - Open a terminal and run the command:
     ```bash
     ruby hangman.rb
     ```

2. **Game Rules:**
   - You have to guess the letters in the secret word.
   - Every turn, enter a letter to make a guess (case insensitive).
   - You can also type 'save' to save the game or 'exit' to quit.
   - The game will display the current state of the word, guessed letters, and the number of incorrect guesses left.

3. **Winning/Losing:**
   - If you correctly guess all the letters, you win!
   - If you run out of guesses, you lose, and the secret word is revealed.

4. **Loading a Saved Game:**
   - If you have a saved game, you can choose to load it when starting the game.
   - The game will resume from where you left off.

## Files

- `hangman.rb`: The Ruby script for the Hangman game.
- `google-10000-english-no-swears.txt`: The dictionary file used to randomly select the secret word.
- `hangman_save.json`: The file where the game state is saved.

## How to Load a Saved Game

1. When prompted at the beginning, type 'load' to load a saved game.
