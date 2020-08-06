/*
  Description: Processing Assignment One
 Authors: Mihir Kachroo, Nand Vinichhi, Veer Gadodia
 Date of last edit: August 9, 2020
 */

//Variables used to make the mountains in the background
float[] mountainElements = new float[72];
float mountainY;
float mountainXStart;
float mountainXEnd;
float mountainX;

//Variables used to make the racing tracks on the side of the road
float racingTrackY;
float racingTrackThickness;
float racingTrackYChange;

//Variables used to make the grey road in the middle
float roadLineYChange;
float roadLineX;
float roadLineY;
float roadLineWidth;
float roadLineHeight;

//Variable that changes where the X-axis of the car is
float carDirection;

//Variable to judge if the user uses the mouse or the arrow keys to control the car
boolean mouseControl;

//Variable to randomly choose which obstacle will appear
float obstacleChoice;

//Variables for the rock obstacles
float rockY;
float rockSize;
float rockX;
float rockSide;

//Variables for the cow obstacle
float cowY;
float cowSize;
float cowX;

//Variables used to make the first cloud
float cloudX;
float cloudY;
float cloudHorizontal;
float cloudXChange;
float cloudYChange;

//Variables used to make the second cloud
float cloud2X;
float cloud2Y;
float cloud2Horizontal;
float cloud2XChange;
float cloud2YChange;

//Variables for the sign that appears to show the number of laps
float signX;
float signY;
float signWidth;
float signHeight;
float signTextSize;

//Variable to decide if the sun is on or off
boolean flashingSun;

//Variable to decide if the flames are visible or not
boolean showFlames;

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

//Variable to control the size of the explosion of the car
float explosionSize;

//Variable that counts the number of times that 'p' has been clicked so we know if the user wants to pause or resume
float pauseCounter;

//Variable for the ending line
String ending="You Lose";

//Variable used to change the size of the text on the "win" screen
float endingTextSize;

//Variable used to adjust the delay of the screen
int delay;


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

  //Sets the coordinates of the mountain
  mountainXStart = random(-60, -30);
  mountainX = random(75, 120);
  mountainXEnd = mountainX+mountainXStart;
  mountainY = random(230, 260);

  //Adds random values for points in the mountain to an array which will be accessed later
  for (int i=0; i<72; i+=4) {
    mountainElements[i] = mountainXStart;
    mountainElements[i+1] = mountainX/2+mountainXStart;
    mountainElements[i+2] = mountainY;
    mountainElements[i+3] = mountainXEnd;
    mountainX = random(95, 120);
    mountainXStart = random(mountainXEnd-60, mountainXEnd-30);
    mountainXEnd = mountainX+mountainXStart;
    mountainY = random(230, 260);
  }

  //Sets the variables for the road
  roadLineX = width/2;  
  roadLineYChange = 8;  
  roadLineY = height/2.15;
  roadLineWidth = 2;
  roadLineHeight = 5.99999;

  //Sets the values for the race tracks at the side of the road
  racingTrackY = 300;
  racingTrackThickness = 2;
  racingTrackYChange = 0;

  //Sets values of the first cloud
  cloudX = random(10, 140);
  cloudY = random(50, 25);
  cloudHorizontal = random(47, 50);
  cloudXChange = random(0, 10);
  cloudYChange = random(-1, 1);

  //Sets values of the second cloud
  cloud2X = random(410, 540);
  cloud2Y = random(55, 25);
  cloud2Horizontal = random(50, 57);
  cloud2XChange = random(0, 10);
  cloud2YChange = random(-1, 1);

  //Sets the default scores
  currentScore = 0;
  lapCounter = 0;
  lapNumber = 0;
  speed = 90;

  //Sets the original x-value of the car
  carDirection = 0;

  //Randomly selects which obstacle shall appear
  obstacleChoice = random(0, 3);

  //Sets values for the first obstacle (the rock)
  rockX = 0;
  rockY = 0;
  rockSize = 1;

  //Sets values for the second obstacle (the cow)
  cowX = -10;
  cowY = 1;
  cowSize = 0.9;

  //Sets variable for the size of the explosion that will occur if the car crashes
  explosionSize = 3;

  //Presets the pause counter to 1
  pauseCounter = 1;

  //Sets the variables for the lap counter sign
  signX = 580;
  signY = height/2.15;
  signWidth = 2;
  signHeight = 5.99;
  signTextSize = 0.5;

  //Sets the boolean for the sun to shine to true
  flashingSun = true;

  //Sets the text size for the "win" screen
  endingTextSize = 10;

  //Sets the boolean for the flames to show to false
  showFlames = false;
}

void draw() {
    if (startScreen) {
    rectMode(RADIUS);
    //Highlights (by changing the colour) the option which the user is hovering over
    if (mouseX<398 && mouseX>100 && mouseY<503 && mouseY>196) {
      fill(49);
    } else {
      fill(0);
    }
    //Creates the left rectangle
    stroke(255);
    strokeWeight(5);
    rect( width/2-225, height/2, 150, 100);


    //Highlights (by changing the colour) the option which the user is hovering over
    if (mouseX<852 && mouseX>552 && mouseY<500 && mouseY>196) {
      fill(190);
    } else {
      fill(255);
    }
    //Creates the right rectangle
    stroke(0);
    rect( width/2+225, height/2, 150, 100);


    if (mousePressed) {
      //Starts game and turns mouse control off if user selects the left button
      if (mouseX<398 && mouseX>100 && mouseY<503 && mouseY>196) { 
        mouseControl = false;
        startScreen = false;
        startGame = true;
      }
      //Starts the game and turns mouse control on if the user selects the right button
      else if (mouseX<852 && mouseX>552 && mouseY<500 && mouseY>196) {
        mouseControl = true;
        startScreen = false;
        startGame = true;
      }
    }

    //Display the text that state the two options for playing
    textAlign(CENTER);
    fill(0, 102, 153);
    textSize(40);
    text("Arrow Keys", width/2-225, height/2+7);
    text("Mouse", width/2+225, height/2+7);
  }


  //Runs the game if the boolean startGame is true
  if (startGame) {
    
    //Creates the race tracks on the sides of the road
    noStroke();
    racingTrackY = 300;
    racingTrackThickness = 2;
    rectMode(RADIUS);
    //Creates stripes accross the tract that are growing in size
    for (int a = 1; a<25; a += 1) {
      //Alternates between creating a red and white stripe
      if (a%2==0) {    //If a is even, it creates a red stripe
        fill(220, 60, 48);
      } else {     //If a is odd, it creates a white stripe
        fill(255);
      }
      //Draws the stripes
      racingTrackY += racingTrackThickness;
      racingTrackThickness *= 1.19;
      rect(width/2, racingTrackY+racingTrackYChange, 325, racingTrackThickness);
    }

    //Shifts all of the stripes down to create a moving effect
    racingTrackYChange+=8;

    //Restarts the creation of the stripes if the stripes go over a certain value
    if (racingTrackY+racingTrackYChange>height+305) {
      racingTrackYChange = 2;
    }


    //Creates the green grass
    fill(65, 160, 75);
    quad(0, height, 0, height/2.15, 390, height/2.15, 150, height); //Makes grass on the left side of road
    quad(800, height, 560, height/2.15, width, height/2.15, width, height);//Makes grass on the right side of road

    //Creates the road itself
    fill(153, 152, 158);
    quad(195, height, 400, height/2.15, 550, height/2.15, 755, height); //Makes middle of road


    //Creates the painted white road lines that come down the middle of the road
    fill(247, 250, 255);
    for (int i = -3; i<6; i += 1) {
      rect(roadLineX, i*70+roadLineY, i*0.8+roadLineWidth, i*2+roadLineHeight);
    }
    //Shifts the lines down and makes them bigger to give the illusion of movement
    roadLineY = height/2.15+roadLineYChange;
    roadLineYChange += 8;
    roadLineWidth += 0.1;
    roadLineHeight += 0.285;

    //Resets the road values to restart the animation of the white line if it crosses a certain point
    if (3*70+roadLineY+roadLineHeight>=695.5814) {
      roadLineYChange = 8;  
      roadLineY = height/2.15+1;
      roadLineWidth = 2.05;
      roadLineHeight = 6.1;
    }

  }
}
