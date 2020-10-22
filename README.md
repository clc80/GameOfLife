# GameOfLife
<img src="https://media.giphy.com/media/WlJa5Q7TuGLNEuys68/giphy.gif" height="300" />
We were tasked with creating an iOS application of Conway's game of life. 

## Brief History of Conway's Game of Life
The Game of Life, created by mathematician John Horton Conway, first appeared in the October 1970 edition of Scientific American. The rules of this single-person logic game are very simple, but often lead to very surprising results. 

## Instructions for the Game of Life
Conway's Game of Life was originally played on a flat grid made up of square cells. These cells can be either live (with a token in it) or dead (no tokens in it).

This is a solitary game, or one with just one player, and the play of a typical game goes like this:

* Player chooses an initial set up.
* Rules are applied to see what happens in the next generation.
* Play continues until one of three things happens: all cells are dead, no cells change from one generation to the next, or the pattern flips back and forth between two or more positions.

Of course, like any game, there are rules! Here's a quick overview.

## Rules for Conway's Game of Life
At the heart of this game are four rules that determine if a cell is live or dead. All depend on how many of that cell's neighbors are alive.

* Births: Each dead cell adjacent to exactly three live neighbors will become live in the next generation.
* Death by isolation: Each live cell with one or fewer live neighbors will die in the next generation.
* Death by overcrowding: Each live cell with four or more live neighbors will die in the next generation.
* Survival: Each live cell with either two or three live neighbors will remain alive for the next generation.
* Another important fact about the rules for the game of life is that all rules apply to all cells at the same time.

## Features

- [x] Grid to display cells.
- [x] Properties: current state: (alive, dead), (black, white)
- [x] Clickable/Tappable: can be clicked to allow user to setup initial cell configuration should NOT be clickable while simulation is running
- [x] Behaviors: Toggle state functionality: switch between alive & dead either because user manually toggled cell before starting simulation or simulation is running and rules of life caused cell to change state
- [x] An appropriate data structure to hold a grid of cells that is at least 25x25. Go as big as you want.
- [x] Text to display current generation # being displayed
- [x] Utilize a timeout function to build the next generation of cells & update the display at the chosen time interval
- [x] Button(s) that start & stop the animation
- [x] Button to clear the grid
- [x] A few sample cell configurations that users can load and run
- [x] An option that creates a random cell configuration that users can run
- [x] Manually step through the simulation one generation at a time, as opposed to animating automatically


## Authors

* **Claudia Maciel** 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
