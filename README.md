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

- give nudge to ball based on distance from platform centre
- basic main menu
- go to next level when win
- implement win conditions
- lose conditions (3 life points?)
- powerup mechanism (figure out )
<br>
Other items on checklist will come later. 