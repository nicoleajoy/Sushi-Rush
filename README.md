![Sushi-Rush](https://github.com/nicoleajoy/Sushi-Rush/blob/master/main/data/images_github_icon.JPG?raw=true)

# Sushi Rush
Hello! Thank you for downloading my game, Sushi Rush! This game currently runs on Processing version 3.x (library imports should work on any Processing 3.x versions). Check out the demo video for it [here](https://youtu.be/g7SrBz3Ejmc).

## Library Imports
Before running the game, please make sure to download the libraries as they are imported into the program. They are necessary to properly run the game and to visualize everything.

### GifAnimation
1. [Download](https://github.com/extrapixel/gif-animation) the library and unzip the “gifAnimation.zip” folder
2. put the extracted folder in the following directory: `<PathToProcessingSketchFolder>/libraries`
### Minim
1. [Download](http://www.cs.cmu.edu/~jar/cn21.pdf) from Processing > Sketch > Add Library > “Minim”

## Game Description
### Overview
The genre of Sushi Rush is arcade/strategy game that follows the general game mechanics of the popular game, Fruit Ninja.
#### Objective
The objective is to slice down as many pieces of sushi as possible, collecting enough points while avoiding bombs, to eventually beat the high score.

## UI/Controls & Gameplay
### TITLE SCREEN
There is currently one level implemented that can be set to an EASY or HARD difficulty from the title screen. By default, the level is set to EASY. Once the user is satisfied with the difficulty setting, they can select the START button to start the game (GAMEPLAY SCREEN). The user can exit the program by clicking on the QUIT button on the title screen. Likewise, the program can be terminated at any point by pressing the ESC key.
### GAMEPLAY SCREEN 
In the gameplay screen, there is an X button on the upper left corner for when the user wishes to return to the title screen. The main UI is located on the top of the screen, including the current score, high score, and health (or lives). Both sushi and bombs will be thrown, allowing the player to chop (or avoid) them. Bombs must obviously be avoided and are worth -5 points (deduct from current score and remove one life). Sushi pieces are each worth 10 points (add to the current score). There are currently only two gameplay modes:
1. In EASY mode, the player begins with three lives. The speed of sushi and bombs is relatively slow, and there are no available powerups.
2. In HARD mode, the player only has one life. The speed of both sushi and bombs doubles, and powerups are made available. There are two powerups: ICE (slows down the game speed for 6 seconds) and STAR (worth twice a sushi’s value). 
### HOW-TO-PLAY 
The player must click, hold, and drag their mouse across the screen. If the mouse touches a sushi or a bomb, a collision is detected. If a sushi collision is detected, points are added to the current score, and the piece is cut in half. If a bomb collision is detected, points are deducted, and a life is lost. In both cases, the sushi/bomb becomes transparent to show that the collision was counted. But the game continues! The game goes on until one of the following:
1. Player loses their last life
2. The X button is clicked
### GAMEOVER SCREEN 
This screen is obtained only when all lives are lost. Simply click the X button in the upper right corner to return to the title screen and try again!

## Development Difficulties
### TRACKING SCREEN LAYOUTS
I spent quite a decent amount of time on the screen layouts and tracking which screen (Title, Level, End) is active. I remembered a wise saying from one of my programming fundamentals professors: “If you are stuck, chances are you need to add another variable.” Surely, after adding a few more Boolean variables and if-else statements, I was able to solve all my problems. 
### SPECIAL PROCESSING FUNCTIONS
Another difficulty I encountered was dealing with the mousePressed() and mouseDragged() functions when it came to button clicks and actual gameplay mechanics (mouse dragging/holding). My original implementation involved using the mouseClicked Boolean variable. The issue with this is that when I used it, it would count all the frames that the mouse was held, and my program would either keep adding values to the total score multiple times, or it would take away all the health/lives with just one bomb collision. To fix this, I changed the implementation to include mousePressed() and mouseDragged() functions and rearranged several lines of code.
