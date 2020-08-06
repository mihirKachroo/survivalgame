/*
  Description: Processing Assignment One
 Authors: Mihir Kachroo, Nand Vinichhi, Veer Gadodia
 Date of last edit: August 9, 2020
 */


//Variable to control the activation of the start, game and ending
boolean startScreen;
boolean startGame;
boolean endGame;

//Variables to inform the user of their scores
int topScore;
int currentScore;
int lapNumber;
int lapCounter;
int speed;

//Variable that counts the number of times that 'p' has been clicked so we know if the user wants to pause or resume
float pauseCounter;

//Variable used to change the size of the text on the "win" screen
float endingTextSize;

//Variable used to adjust the delay of the screen
int delay;

//Variable to judge if the user uses the mouse or the arrow keys to control the car
boolean mouseControl;

void settings() {
  size(950, 700);
}

void setup() {   
  background(90, 205, 249);

  //Outputs the game introduction for user into the console
  println("Welcome to the Game");
  println("Objective:");
  println("  Do not hit an obstacle or go off the road");
  println("  Get to lap 10 to win");
  println("Instructions:");
  println("  Use Mouse or Arrow Keys");
  println("  Press Space Bar for a speed boost but beware that the boost leads to less control over the car");
  println("  Click on the sun to change time of day");
  println("  Press p to pause and resume");
  println("  Press e to quit");

  startScreen = true; //Presets the start screen to on
  startGame = false; //Presets the game to off
  endGame = false; //Presets the end screen to off

 

  //Sets the default scores
  currentScore = 0;
  lapCounter = 0;
  lapNumber = 0;
  speed = 90;

}

void draw() {
  

  //Runs the game if the boolean startGame is true
  if (startGame) {
  }
}
