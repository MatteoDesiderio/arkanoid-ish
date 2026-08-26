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
- in the ```level.gd``` script: remove 1 from ```var balls_number``` when the ball hits the ground
- in the ```level.gd``` script: remove a life and reset the ball only when ```balls_number = 1```
- in the ```ball.gd``` script: ```queue_free``` when the ball hits the ground


- implement win game conditions (all levels cleared)
- powerup mechanism (figure out: random drop?)
- add random direction when ball stuck for too long in some bounce configuration (it happens) 

- options: music and SFX volume
- pause button: what's in it? Options? Back to menu?
- when u win level, go back to menu when relevant button is pressed 

- powerup base scene has script with x% chance of being a given type of powerup
- change look of powerup when spawn based on type 
- platform powerups: length, stick
- ball powerup: multiply, bomb, eraser

<br>
Other items on checklist will come later. 
