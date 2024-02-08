# Mastermind Game

This is a simple implementation of the Mastermind game in Ruby for the command line.

## Game Rules

- The secret code consists of four colors chosen from the set: red, yellow, green, blue, purple, orange
- The player has 12 turns to guess the secret code.
- After each guess, the game provides feedback on the number of exact matches and color matches.

## Gameplay Options

### Code Maker (M)

If you choose to be the code maker, you will input the secret code, and the computer will try to guess it.

### Code Breaker (B)

If you choose to be the code breaker, the computer will generate a secret code, and you will try to guess it.

## Code Examples

### Guessing as Code Breaker

When guessing as the code breaker, you will input your guesses following the format.

    ```bash
    Do you want to be the code maker (enter 'M') or code breaker (enter 'B')? B
    Welcome to Mastermind!

    Secret code: red, red, blue, yellow
    Enter your guess : red, red, orange, blue 
    ```

### Setting the Code as Code Maker

When setting the code as the code maker, you will input your secret code following the format.

    ```bash
    Do you want to be the code maker (enter 'M') or code breaker (enter 'B')? M
    Enter your secret code: red, red, blue, yellow
    Welcome to Mastermind!

    Turn 1: red, red, blue, purple   Exact Matches: 3   Color Matches: 3
    ```