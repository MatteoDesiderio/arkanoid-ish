# Small project to learn Godot and GDScript: make a clone of arkanoid

## 
The aim for this project is to have a good game feel, few powerups and pleasant graphics.<br>
Will try to also make it easy to implement new powerups. <br>

NO boss fights, let's keep this simple.  

## Project logic/structure 
For now, a level is made of the following scenes:
- level_content
- walls
- ball
- platform
- bricks 

The level_content basically references all the other objects and manages the gameplay. <br>
The bricks scene is originally empty, but is changed/designed in the editor manually in each level, because it is a TileMapLayer object. <br>

NOTE: For now the source_id of the breakable brick is '2'. Subject to change if tiles change 

## To do:
- generate new game data when game is started for the very first time
- but keep the game data when the player exits the game
- add option to reset game data 
- basic main menu
- implement win game conditions
- powerup mechanism (figure out: random drop?)
- add random direction when ball stuck for too long in some bounce configuration (it happens) 


<br>
Other items on checklist will come later. 
