# Connect Four Game

Welcome to the Connect Four game implementation in Ruby!

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Game Rules](#game-rules)
- [Tests](#tests)

## Introduction

This project is a Ruby implementation of the classic game Connect Four. The game provides a console-based interface where players can take turns to drop their pieces into a vertically suspended grid. The first player to connect four of their pieces in a row, column, or diagonal wins the game.

## Features

- Interactive console-based gameplay.
- Player vs. AI mode.
- Test-Driven Development (TDD) for code reliability.
- Modular and extensible codebase.

## Game Rules

- The game is played on a 6x7 grid.
- Players take turns dropping their pieces into any of the seven columns.
- The piece will occupy the lowest available empty space in the selected column.
- The first player to connect four of their pieces in a row, column, or diagonal wins.
- If the entire grid is filled without a winner, the game ends in a draw.

## Tests

This project uses RSpec for testing.